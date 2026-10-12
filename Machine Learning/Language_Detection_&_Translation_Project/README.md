### Project Name : Language Detection and Translation

## About :
- This project uses Machine Learning to detect the language of user-entered text and translate the text into a selected language.

## Project Features :
- Detects the language of entered text.
- Converts text into numerical features using CountVectorizer.
- Uses the Multinomial Naive Bayes algorithm for language classification.
- Splits the dataset into training and testing sets.
- Evaluates model accuracy using the test dataset.
- Translates text into the selected language using GoogleTranslator.
- Displays the original text, detected language, and translated text.

## Technologies Used :
- Python
- NumPy
- Pandas
- Scikit-learn
- CountVectorizer
- Multinomial Naive Bayes
- GoogleTranslator
- Jupyter Notebook

## Machine Learning Workflow :
  1. Load the text and language dataset.
  2. Separate text and language labels.
  3. Convert text into numerical features using CountVectorizer.
  4. Split the data into training and testing sets.
  5. Train the Multinomial Naive Bayes model.
  6. Evaluate model accuracy.
  7. Predict the language of user-entered text.
  8. Translate the text into the selected language.

## Model Evaluation :
- The model accuracy is calculated using the test dataset. The accuracy percentage is displayed when the program runs.

## Objective :
To build a simple Machine Learning application that identifies the language of text and provides translation into another selected language.
