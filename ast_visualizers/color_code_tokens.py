from PIL import Image, ImageDraw, ImageFont
import nltk
import os

SAVE_PATH = "/home/c_byrne/school/courses/csc372-programming_languages/assignments/small-assignments"
FILENAME = "color_coded_tokens.png"
DISPLAY_EXAMPLES = True
REPLACE_TOKEN_TYPE_NAMES = {
    "DT: determiner": "AT: article",
    "IN: preposition or conjunction, subordinating": "IN: preposition",
}

if not os.path.exists(SAVE_PATH):
    raise FileExistsError(f"Path {SAVE_PATH} does not exist")

# Download necessary NLTK datasets
nltk.download("punkt")
nltk.download("averaged_perceptron_tagger")

# Sample sentence
sentence = "the girl has a gift for the boy in the car"

# Tokenize and POS tag the sentence
tokens = nltk.word_tokenize(sentence)
pos_tags = nltk.pos_tag(tokens)
# Define color map for POS tags
color_map = {
    "NN": "blue",  # Noun
    "VB": "green",  # Verb
    "JJ": "orange",  # Adjective
    "RB": "purple",  # Adverb
    "DT": "red",  # Determiner
    "IN": "brown",  # Preposition
    "CC": "pink",  # Coordinating conjunction
    "PR": "gray",  # Pronoun
    "MD": "olive",  # Modal
    "TO": "cyan",  # To
    "UH": "gold",  # Interjection
    "FW": "magenta",  # Foreign word
    "CD": "teal",  # Cardinal number
    "WP": "navy",  # Wh-pronoun
    "WR": "lime",  # Wh-adverb
    "EX": "maroon",  # Existential there
    "RP": "indigo",  # Particle
    "POS": "khaki",  # Possessive ending
    "SYM": "sienna",  # Symbol
    "LS": "orchid",  # List item marker
    "PDT": "salmon",  # Predeterminer
    "WP$": "lavender",  # Possessive wh-pronoun
    "NNP": "skyblue",  # Proper noun
    "NNPS": "lightcoral",  # Proper noun plural
    "NNS": "lightgreen",  # Noun plural
    "VBG": "lightyellow",  # Verb gerund
    "VBD": "lightcyan",  # Verb past tense
}

BASE_FONTSIZE = 64

# Create a blank image with white background
image_width = 2048
image_height = image_width // 2
image = Image.new("RGB", (image_width, image_height), (255, 255, 255))
draw = ImageDraw.Draw(image)

# Load a font (use a default one, or provide a path to a specific font)
font = ImageFont.truetype("arial.ttf", BASE_FONTSIZE)

# Starting coordinates for drawing the text
OFFSET_X = image_width // 13
OFFSET_Y = image_height // 6
x, y = OFFSET_X, image_height // 2 - OFFSET_Y

seen_token_types = set()

# Draw each word with color-coded based on its POS tag
for word, tag in pos_tags:
    seen_token_types.add(tag)
    tag_base = tag[:2]
    color = color_map.get(tag_base, (0, 0, 0))  # Default to black if tag not found

    # Draw the word
    draw.text((x, y), word, fill=color, font=font)

    # Get the bounding box of the text
    bbox = draw.textbbox((x, y), word, font=font)
    text_width = bbox[2] - bbox[0]

    # Update x-coordinate for the next word (add a little space)
    x += text_width + 10

nltk.download("wordnet")
nltk.download("tagsets")

from nltk.corpus import wordnet
from nltk.data import load
import re
from textwrap import wrap


def format_descriptions(tags, tagdict, tag_base, include_examples=True, example_count=5):
    for tag in tags:
        entry = tagdict[tag]
        # defn = [tag + ": " + entry[0]]
        # examples = wrap(
        #     entry[1], width=75, initial_indent="    ", subsequent_indent="    "
        # )
        tag_display = tag if tag == tag_base else f"{tag} ({tag_base})"
        descrip = f"{tag_display}: {entry[0]}"
        # descrip = f"{entry[0]}"
        if include_examples:
            descrip += f" ({', '.join(entry[1].split(' ')[:example_count])}, ...)"
        return apply_replacements(descrip)


def apply_replacements(description: str) -> str:
    for old, new in REPLACE_TOKEN_TYPE_NAMES.items():
        description = description.replace(old, new)
    return description


def get_tag_description(
    tagpattern, tag_base, tagset="upenn_tagset", include_examples=True, example_count=5
):
    # try:
    #     # return wordnet._tagset.
    #     return wordnet._tagset
    # except KeyError:
    # print(f"Unknown tag: {tag}")
    # nltk.help.upenn_tagset(tag)
    # return tag

    tagdict = load("help/tagsets/" + tagset + ".pickle")
    if tagdict is None:
        raise ValueError(f"Unknown tagset: {tagset}")
    if not tagpattern:
        return format_descriptions(
            sorted(tagdict),
            tagdict,
            tag_base,
            include_examples=include_examples,
            example_count=example_count,
        )
    elif tagpattern in tagdict:
        return format_descriptions(
            [tagpattern],
            tagdict,
            tag_base,
            include_examples=include_examples,
            example_count=example_count,
        )
    else:
        tagpattern = re.compile(tagpattern)
        tags = [tag for tag in sorted(tagdict) if tagpattern.match(tag)]
        if tags:
            return format_descriptions(
                tags,
                tagdict,
                tag_base,
                include_examples=include_examples,
                example_count=example_count,
            )
        else:
            print("No matching tags found.")


# Draw the legend
legend_x = OFFSET_X // 4
legend_y = image_height // 2 + OFFSET_Y // 6

font = ImageFont.truetype("arial.ttf", BASE_FONTSIZE // 4)
for i, tag in enumerate(seen_token_types):
    tag_base = tag[:2]
    color = color_map.get(tag_base, (0, 0, 0))  # Default to black if tag not found

    display_text = get_tag_description(tag, tag_base, include_examples=DISPLAY_EXAMPLES)
    draw.text((legend_x, legend_y), display_text, fill=color, font=font)
    legend_y += OFFSET_Y // 4

# Save or display the image
image.show()

# If file exists, overwrite it
if os.path.exists(os.path.join(SAVE_PATH, FILENAME)):
    os.remove(os.path.join(SAVE_PATH, FILENAME))

image.save(os.path.join(SAVE_PATH, FILENAME))
