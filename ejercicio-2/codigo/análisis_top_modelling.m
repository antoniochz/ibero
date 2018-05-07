filename = "articles1.csv";
data = readtable(filename,'TextType','string');
textData = data.content;
documents = preprocessWeatherNarratives(textData);
bag = bagOfWords(documents);
bag = removeInfrequentWords(bag,2);
bag = removeEmptyDocuments(bag);
numTopics = 60;
mdl = fitlda(bag,numTopics);
figure;
for topicIdx = 1:4
    subplot(2,2,topicIdx)
    wordcloud(mdl,topicIdx);
    title("Topic: " + topicIdx)
end


function [documents] = preprocessWeatherNarratives(textData)
% Erase punctuation.
cleanTextData = erasePunctuation(textData);

% Convert the text data to lowercase.
cleanTextData = lower(cleanTextData);

% Tokenize the text.
documents = tokenizedDocument(cleanTextData);

% Remove a list of stop words.
documents = removeWords(documents,stopWords);

% Remove words with 2 or fewer characters, and words with 15 or greater
% characters.
documents = removeShortWords(documents,2);
documents = removeLongWords(documents,15);

% Normalize the words using the Porter stemmer.
documents = normalizeWords(documents);
end