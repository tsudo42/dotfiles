#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re, sys, subprocess

# pyobjc-framework-DictionaryServices is needed
from CoreServices import DictionaryServices

SP = "osascript /Users/tsudo/dotfiles/bin/spelling.scpt"

# sys.stdout = codecs.getwriter('utf-8')(sys.stdout)

def look_up(word):
    return DictionaryServices.DCSCopyTextDefinition(None, word, (0, len(word)))


def format_for_j_to_e(line):
    line = re.sub('([ぁ-んァ-ン一-龥])\s*([a-zA-Z])', r'\1\n\2', line)
    line = re.sub('([a-zA-Z.\)!?])\s*([ぁ-んァ-ン一-龥▸])', r'\1\n\n\2', line)
    line = re.sub('(名詞|動詞|形容詞|副詞)', r'\1\n', line)

    return '\n' + line

ELEMENTS = '名詞|代名詞|自動詞|他動詞|形容詞|副詞|助動詞|前置詞|冠詞|接続詞|間投詞|接頭辞|接尾辞|語根'

def format_for_e_to_j(line):

    entry = re.match('^([^|^名]*) ', line).expand('\\1')
    entry = re.sub('･', '', entry).strip()
    entry = re.sub('^-', '', entry).strip()
    entry = re.sub('-$', '', entry).strip()
    entry = re.sub('-, -', ', ', entry).strip()
    return_list = [f'<{entry}>']

    def format_description(line):
        # remove examples
        line = re.sub('▸.*', '', line)
        # remove parenthesis
        line = re.sub(' ?\([^)]*\) ?;?', '', line)
        # remove countableness symbol
        line = re.sub('^[CU]?(\d)* ?[CU]?', ' \\1 ', line)
        return (line)

    # separate
    line = re.sub('動詞[^.]*([自|他]動詞)', '\\1', line)
    line = re.sub('無冠詞', '', line)

    line = re.sub(f'^[^.^詞]*({ELEMENTS})', '\\1', line)
    line = re.sub(f'\. ({ELEMENTS})', '.\n\\1', line)
    words = line.split('\n')

    for word in words:
        word = re.sub(f'^({ELEMENTS})', '\\1\n', word)
        word_split = word.split('\n')
        header = word_split[0]
        content = word_split[1]

        # remove pronunciation notation
        content = re.sub('.*\| ', '', content)
        # remove c.f.
        content = re.sub('～́.*', '', content)

        items = [l.strip() for l in content.split('.')[:-1]]
        if re.match('^[UC]?\d', items[0]):
            tmp = []
            for item in items:
                if re.match('^[UC]?\d', item):
                    tmp.append(format_description(item))
            content = '\n'.join(tmp)
        else:
            content = format_description(items[0])

        return_list.append(f'[{header}]')
        return_list.append(content)
    return '\n'.join(return_list)

def suggest_and_re_process(word):
    suggests = [s for s in subprocess.getoutput(f'{SP} {word}').split(', ') if s != '']

    if suggests:
        for i, suggest in enumerate(suggests, 1):
            print('%d: %s' % (i, suggest))
        print('0: abort')

        try:
            n = int(input('> ')) - 1
        except ValueError:
            sys.exit()

        if n != -1:
            process(list(suggests)[n])

    else:
        print('\nno suggests.')


def process(word):
    result = look_up(word)

    if re.match('[a-zA-Z]', word) is None:
        if result is None:
            print('\nno results.')

        else:
            print(format_for_j_to_e(result))

    else:
        if result is None:
            suggest_and_re_process(word)

        else:
            print(format_for_e_to_j(result))


if __name__ == '__main__':
    argc = len(sys.argv)
    if argc < 2:
        print('usage: dict <word>')
        sys.exit()

    word = ' '.join(sys.argv[1:])

    try:
        process(word)

    except KeyboardInterrupt:
        print("")
        sys.exit(0)
    except EOFError:
        print("")
        sys.exit(0)
