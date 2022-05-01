The two ways we learn best are by Active Recall studying through question and answer formation, and Spaced Repetition.

In order to minify the "friction" of creating cards, these simple AHK scripts might help.

The intended workflow is as follows:

1. Ensure your target file.md in Obsidian has the following at the top (assuming your target desk is named "test"):

## Test cards

TARGET DECK: test

<!-- Tags applied to all cards in this file -->

FILE TAGS: tag1, tag2

2. Obsidian allows you to make toggleable checklists in the following format:

- [ ] What is the meaning of the life, the universe, and everything? #life
  - [ ] The answer is 42.

3. Ensure you have "ankify_togglelist.ahk bound to a shortcut, then with cursor over question press Win-V for example. It will ask for a target Obsidian file. This is customizable. It will be output to 'test' in Obsidian to Anki compatible format:

START
Basic
What is the meaning of the life, the universe, and everything?
Back:
Test The answer is 42.
Tags: life

<!--ID: 1651223569765-->

END

4. Press sync with Anki open and it will turn these cards to flashcards.4) Press sync with Anki open and it will turn these cards to flashcards.4) Press sync with Anki open and it will turn these cards to flashcards.4) Press sync with Anki open and it will turn these cards to flashcards.
