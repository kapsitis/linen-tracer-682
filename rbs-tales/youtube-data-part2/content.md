# &nbsp;

<hgroup>

<h1 style="font-size:28pt">YouTube Data</h1>

<blue>Sentiment Analysis</blue>

</hgroup><hgroup>

<span style="color:darkgreen">**(1) Introduction**</span>  
<span>(2) [Dictionary-based analysis](#section-1)</span>  
<span>(3) [LAB 2.1: Filter by Regular Expressions](#section-2)</span>  
<span>(4) [Browser Automation](#section-3)</span>  
<span>(5) [Analysis by Machine Learning](#section-4)</span>  
<span>(6) [LAB 2.2: Clustering Videos](#section-5)</span>  
<span>(7) [Summary](#section-6)</span>

</hgroup>











# <lo-why/> why

<div class="bigWhy">

Why reactions to videos matter?

</div>
<div class="smallWhy">

* Why user feedback can improve your content?
* Why measuring feedback may depend on the genre 
and the objectives?

</div>




# <lo-theory/> Objectives

* Analyze texts to learn what customers are saying about you; 
how they react to various content.
* Classify comments by sentiment lexicons. 
* Define regular expressions for search and classification.
* Classify comments by Machine Learning (Naive Bayes, SVM)


## <lo-summary/> What is Sentiment Analysis

* Comments may not always be sufficient: Some users
only watch (or even just listen) YouTube, they do not interact
as in a social network. 
* Authors may disable comments for any of their videos.
* [YouTube is disabling comments on almost all videos featuring children](https://www.theverge.com/2019/2/28/18244954/youtube-comments-minor-children-exploitation-monetization-creators)

Still, we can search only by things that we can see. 




## <lo-summary/> Understand what People Say about You

* Selling a product or a service.
* "A brand is no longer what we tell the customer it is; 
it is what customers tell each other it is."  
(Scott David Cook; eBay, Procter & Gamble)
* People's opinions online (like, hate, etc.)
* Machines are ideally suited to monitor the opinions.

## <lo-summary/> NLP, Opinion Mining, Sentiment Analysis

* Opinions are meant to be subjective. 
* NLP means "natural language processing"; not
"neiro-lingvistiskā programmēšana" (in Latvian 
this acronym also refers to an art to manipulate 
people - this is **not** meant here).

## <lo-summary/> Assigning an evaluation

* Satisfied or dissatisfied customers
* Positive or negative remark for a video.

Harder to come up with "1-5 star ratings" for
specific aspects of a product or a video. 
In such cases it is usually 
better to provide a small feedback form. 

* Live comments during YouTube broadcasts.
* Feedback on political advertising.


## <lo-summary/> Positive or Negative?

* "Is this review positive or negative?"  
The key problem in sentiment analysis 
is defining the semantic orientation of 
a review or a comment.
* Widely used for movie reviews, also 
music, hotels, news, electronics... Various
other products and services. 
* Evaluating people (candidates in politics, etc.)
is interesting, but harder; people may use
irony (express their opinion using just the opposite
words) - such language is not
self-sufficient, it depends on broader context. 



## <lo-summary/> Sentiment Analysis in Latvian

* For English language there are some Machine Learning
models that are already trained to find the sentiments
(the model has to be *trained* by sample data). 
* In Latvian we use a different approach: dictionaries
with word stems expressing emotions.


# &nbsp;

<hgroup>

<h1 style="font-size:28pt">YouTube Data</h1>

<blue>Sentiment Analysis</blue>

</hgroup><hgroup>

<span>(1) [Introduction](#section)</span>  
<span style="color:darkgreen">**(2) Dictionary-based analysis**</span>  
<span>(3) [LAB 2.1: Filter by Regular Expressions](#section-2)</span>  
<span>(4) [Browser Automation](#section-3)</span>  
<span>(5) [Analysis by Machine Learning](#section-4)</span>  
<span>(6) [LAB 2.2: Clustering Videos](#section-5)</span>  
<span>(7) [Summary](#section-6)</span>

</hgroup>



# <lo-theory/> Rule-based Approach

* Start with a large corpus of texts; analyze common words. 
* Come up with mini-dictionaries (called *lexicons*) 
or patterns (called *regular expressions*) to 
filter out interesting "features" in the texts.
* Also relationships between words. 

**Note:** Lexicons are similar to *dictionaries*, but unlike dictionaries 
they do not store meanings of words.


## <lo-theory/> What is ML-based Sentiment Analysis

* ML learns from data itself using statistics
or neural networks or similar. 
* No need to define rules. 
* May need data classified by humans 
for supervised learning.



# <lo-theory/> Positive, Negative and Neutral Words

Some emotional words are used for emphasis (they do 
not express attitude towards the video or other product):  
("Man **šausmīgi** patika..."/"This was **terribly** nice")

**Some positive words:**

```
(vis)?jauk.*,(vis)?mīlīg.*,(vis)?skaist.*,(vis)?smukāk.*,
piestāv.*,iespārd.*,reeciig.*,rēcīg.*,
wow,super,tii+k,omg,haha
```

**Some negative words:**

```
(vis)?šausmīg.*,(vis)?nejauk.*,(vis)?slikt*,(vis)?garlaicīg.*,(vis)?stulb.*,
heito.*,neciešam.*,
fuj,depressing,
```


**Some neutral words:**

```
instagram,fortnite,akvaparks
```


## <lo-summary/> Emojis

<blue>*Emoji*</blue> (lv:*emocijikonas*, jp:絵文字) small standardized
images that accompany other text symbols. 
There are no orthography rules, but we can measure the
presence of the most popular ones. 




# <lo-sample/> Weight and Threshold Method

* <blue>*Space-normalization*</blue> 
(*atstarpju normalizēšana*) - replace with lower-case
(may need to detect massive use of *ALL CAPS* before this), 
replace punctuation and newlines by spaces; 
replace multiple spaces by a single space. 
Also separate emojis into separate "words". 

TODO: Show how text normalization works
(before and after). 


## <lo-sample/> Stemming

* <blue>*Stemming*</blue> (*celmošana*) -
inflected languages such as Latvian may need to 
separate stems from changing endings. 
English is analytic language; usually do not need this. 
* <blue>*Weighted sum*</blue> (*svērta summa*) - 
each word or pattern gets a weight. All weights are added together.

**Rule-based approach:** If the weighted sum exceeds some 
threshold, the review is positive. 
If it is less than some other threshold, the review is negative. 

## <lo-summary/> Rule-based needs Lexicons

Word "brīnišķīgs" (en:"wonderful") may have a larger positive 
weight than "jauks" (en:"nice") as it expresses a stronger
emotion. But it depends on your approach.

In either case you need 
<blue>*lexicons*</blue> (*leksikoni*) to recognize positive, 
negative or neutral words. 




# <lo-theory/> More complex rule-based systems

[VADER Sentiment Analysis](https://github.com/cjhutto/vaderSentiment) -
a Python library.

* All-caps, emoji, some punctuation symbols and combinations.
* Signals indicating shift to an opposite emotion ("... BUT ..."). 
* Intensifiers of meaning ("very", "really", "hardly", "extremely", 
"terribly"). 

Rules more complicated; but eventually things add up to a numerical
**score** - just as in a weighted sum model.


# &nbsp;

<hgroup>

<h1 style="font-size:28pt">YouTube Data</h1>

<blue>Sentiment Analysis</blue>

</hgroup><hgroup>

<span>(1) [Introduction](#section)</span>  
<span>(2) [Dictionary-based analysis](#section-1)</span>  
<span style="color:darkgreen">**(3) LAB 2.1: Filter by Regular Expressions**</span>  
<span>(4) [Browser Automation](#section-3)</span>  
<span>(5) [Analysis by Machine Learning](#section-4)</span>  
<span>(6) [LAB 2.2: Clustering Videos](#section-5)</span>  
<span>(7) [Summary](#section-6)</span>

</hgroup>





# <lo-sample/> LAB 2.1: Filter by Regular Expression

**Steps:** 

1. Navigate to ... (scan your QR code)
2. Enter Lab 2.1 ... 
3. Open some predefined links. 
4. Edit regular expressions according to your worksheet, 
filter out some language or emojis.



# &nbsp;

<hgroup>

<h1 style="font-size:28pt">YouTube Data</h1>

<blue>Sentiment Analysis</blue>

</hgroup><hgroup>

<span>(1) [Introduction](#section)</span>  
<span>(2) [Dictionary-based analysis](#section-1)</span>  
<span>(3) [LAB 2.1: Filter by Regular Expressions](#section-2)</span>  
<span style="color:darkgreen">**(4) Browser Automation**</span>  
<span>(5) [Analysis by Machine Learning](#section-4)</span>  
<span>(6) [LAB 2.2: Clustering Videos](#section-5)</span>  
<span>(7) [Summary](#section-6)</span>

</hgroup>


# <lo-theory/> Info visible, not available from YouTube API

* Use crawlers (robots, spiders) can save your time.
* Record texts, authors, dates for the comments. 
* Automate your actions, pretend that you are an actual user 
with a browser screen. 


# <lo-theory/> Not All Crawlers are Welcome Everywhere

<div style="font-size:70%">

Visit <a href="https://www.youtube.com/robots.txt">robots.txt</a> on YouTube. 

```
User-agent: Mediapartners-Google*
Disallow:

User-agent: *
Disallow: /channel/*/community
Disallow: /comment
Disallow: /get_video
Disallow: /get_video_info
Disallow: /live_chat
Disallow: /login
Disallow: /results
Disallow: /signup
Disallow: /t/terms
Disallow: /timedtext_video
Disallow: /user/*/community
Disallow: /verify_age
Disallow: /watch_ajax
... 

Sitemap: https://www.youtube.com/yt/sitemap/sitemap.xml
```

</div>



## <lo-summary/> Screen Scraping Technicalities

* YouTube initially opens just the video itself, comments 
start to appear when you scroll down. 
* Some comments near the bottom may be hidden, 
should scroll down even more.
* Should expand replies. 

TODO: Add screenshots...


## <lo-summary/> Can use semi-automatic browsing

For example, log in manually (to avoid storing your
password data), but do screen scraping automatically.




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">YouTube Data</h1>

<blue>Sentiment Analysis</blue>

</hgroup><hgroup>

<span>(1) [Introduction](#section)</span>  
<span>(2) [Dictionary-based analysis](#section-1)</span>  
<span>(3) [LAB 2.1: Filter by Regular Expressions](#section-2)</span>  
<span>(4) [Browser Automation](#section-3)</span>  
<span style="color:darkgreen">**(5) Analysis by Machine Learning**</span>  
<span>(6) [LAB 2.2: Clustering Videos](#section-5)</span>  
<span>(7) [Summary](#section-6)</span>

</hgroup>




# <lo-summary/> Sentiment Analysis Basics


* Naive Bayes
* SVM
* Neural Networks and TensorFlow library
* Logistic regression classifiers...
* Maximum entropy classifiers...

No clear advantages; setup for different methods
may be different (in particular, training data).
Need labeled data...

Documents have different representations - 
individual words, word pairs, frequency vector... 

## <lo-summary/> Supervised learning

* Already need documents marked as positive or negative. 
* Few thousand tweets already marked. 

Training data is very contextual...  
Even human labeling agrees on some 70-80% of the documents.

<!--
Niek Sanders - 5000 labelled tweets
Amazon product reviews (Johns Hopkins, CS)
Movie Reviews (Cornell CS)

NLTK - installs some datasets. 
-->


## <lo-summary/> Comments with ratings

* Some comments could come with labels (referring to the comment
or the youtube video). 
* YouTube videos and also user comments have likes and dislikes.



# &nbsp;

<hgroup>

<h1 style="font-size:28pt">YouTube Data</h1>

<blue>Sentiment Analysis</blue>

</hgroup><hgroup>

<span>(1) [Introduction](#section)</span>  
<span>(2) [Dictionary-based analysis](#section-1)</span>  
<span>(3) [LAB 2.1: Filter by Regular Expressions](#section-2)</span>  
<span>(4) [Browser Automation](#section-3)</span>  
<span>(5) [Analysis by Machine Learning](#section-4)</span>  
<span style="color:darkgreen">**(6) LAB 2.2: Clustering Videos**</span>  
<span>(7) [Summary](#section-6)</span>

</hgroup>




# <lo-sample/> LAB 2.2: Clustering Videos

**Steps:** 

1. Register with GitHub (unless you already have an account). 
2. Clone a small repository with 2 files.
3. Publish that repository using GitHub pages.
4. Edit a file that displays the video clusters.




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">YouTube Data</h1>

<blue>Sentiment Analysis</blue>

</hgroup><hgroup>

<span>(1) [Introduction](#section)</span>  
<span>(2) [Dictionary-based analysis](#section-1)</span>  
<span>(3) [LAB 2.1: Filter by Regular Expressions](#section-2)</span>  
<span>(4) [Browser Automation](#section-3)</span>  
<span>(5) [Analysis by Machine Learning](#section-4)</span>  
<span>(6) [LAB 2.2: Clustering Videos](#section-5)</span>  
<span style="color:darkgreen">**(7) Summary**</span>

</hgroup>




# <lo-theory/> What did we cover? 

* In **LAB 2.2** you browsed some sentiment data visualizations in an 
ad hoc website on *GitHub Pages*.


# <lo-summary/> Where to Go Next

In a research project, one question leads
to *multiple* new questions.

* Can the sentiment analysis detect sarcasm or other uses
of <blue>*figurative language*</blue> (*tēlainās izteiksmes līdzekļi*). 
* How to extract and analyze YouTube video data 
as still images, etc.? (This would involve *deep machine learning*).
* Is there a dependency between the sentiment and user-involvement? 

TODO: Add References that cover various details.

## <lo-summary/> References

* [YouTube Sentiment Analysis](https://github.com/sharan1/youtube-data-sentimental-analysis)
* [Sentiment Analysis with ML](https://youtu.be/AJVP96tAWxw)





# <lo-summary/> The Last Things

* Please go to a page (indicated by the instructor) 
and fill in the feedback. 
* The contact information: Email `kalvis.apsitis` at the domain 
`gmail.com`. 

<blue>Please send your comments and suggestions!</blue>


# <lo-theory/> Notes for Instructors

1. Check, if you have Python 3.7, Pip3 package manager 
and Selenum installed. You will need them when running
the crawler automation task. See 
[Scraping YouTube](https://www.analyticsvidhya.com/blog/2019/05/scraping-classifying-youtube-video-data-python-selenium/)
for details.
2. You will also need to share your mobile device screen on your desktop 
(so that your mobile phone can be shown on the big screen). 
Either **Vysor** or **scrcpy** could be used. 
See e.g. [Scrcpy description](https://www.omgubuntu.co.uk/2019/07/scrcpy-mirror-android-to-ubuntu-linux). 
3. Before the screen sharing works, you will also need to enable USB debugging 
on the mobile device and connect your phone with the laptop with 
a USB cable.












