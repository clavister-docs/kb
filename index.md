<h1>Welcome to Clavister Knowledge Base</h1>

Lorem ipsum dolor sit amet, consectetur adipiscing elit. In lacinia eros eu velit facilisis, et venenatis sem tempus. Nullam vulputate feugiat velit, vel laoreet augue euismod eu.

<div id="search-container" class="main-search" markdown="0">
    <div class="search-control">
        <input type="text" id="search-input" placeholder="Search the Knowledge Base...">
        <button class="search-btn">
            <svg class="search-icon" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19.9 19.7"><g class="search-path" fill="none"><path stroke-linecap="square" d="M18.5 18.3l-5.4-5.4"/><circle cx="8" cy="8" r="7"/></g></svg>
        </button>
        <span id="clear-btn" class="clear-btn">&times;</span>
    </div>
    <div id="results-container" class="search-results"></div>
</div>

<script src="/assets/js/simple-jekyll-search.js" type="text/javascript"></script>
<script type="text/javascript">
    SimpleJekyllSearch({
        searchInput: document.getElementById('search-input'),
        resultsContainer: document.getElementById('results-container'),
        searchResultTemplate: '<div><a href="{{ site.url }}{url}">{title}</a><small class="text-muted">{urltext}</small><p>{_excerpt}</p><small>{tags}</small></div>',
        json: '/search.json',
        templateMiddleware: function(prop, value, template) {
            if (prop === 'title' || prop === 'urltext' || prop === 'tags') {
                var search = document.getElementById('search-input').value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'); // escape string for javascript regex;
                return value.replace(new RegExp(search, 'gi'), `<b>$&</b>`);
            }
        }
    })

    document.getElementById('search-input').addEventListener('input', function(e) {
        var target = (e && e.target) || document.getElementById('search-input');
        document.getElementById('clear-btn').style.display = target.value ? 'block' : 'none';
    });
    document.getElementById('clear-btn').addEventListener('click', function(e) {
        document.getElementById('search-input').value = '';
        document.getElementById('results-container').innerHTML = ''
        var target = (e && e.target) || document.getElementById('clear-btn');
        target.style.display = 'none';
    });

</script>

<div style="display: flex;justify-content: space-between;" markdown="0">
    <div style="flex: 1;">
        <h2>Latest Articles</h2>
{% assign articles = site.pages | where: "layout", "article" | sort: "last_modified_at" | reverse %}
{% for article in articles limit: 5 %}
<div style="margin-bottom: 10px;border-bottom: 1px solid #efefef;padding-bottom: 5px;"><a href="{{article.url}}">{{article.title}}</a><br /><small class="text-muted"><b>{{ article.last_modified_at | date: "%e %b, %Y"}}</b></small> <small>{{article.tags}}</small></div>
{% endfor %}
    </div>
    <div style="margin-left: 30px;max-width: 400px;" markdown="0">
        <div>
            <h2>Browse by Tags</h2>
            <div>
            {% assign alltags = "" | split:"" %}
            {% assign tagstrs = site.pages | where: "layout", "article" | map: "tags" %}

            {% for tagstr in tagstrs %}
            {% assign tags = tagstr | split: " " %}
            {% assign alltags = alltags | concat: tags %}
            {% endfor %}

            {% assign uniqtags = alltags | uniq %}
            {% for t in uniqtags %}
                {% assign counter = 0 %}
                {% for y in alltags %}
                    {% if y == t %}
                        {% assign counter = counter | plus: 1 %}
                    {% endif %}
                {% endfor %}
                <span style="padding: 0px 10px;"><a href="/tag/{{t}}" style="font-size: {{counter | times: 4 | plus: 80}}%;">{{t}}</a></span>
            {% endfor %}
            </div>
        </div>
        <div style="margin-top: 30px;background-color: #fbf1d3;padding: 10px;border: 1px solid #ddd;border-radius: 0.2rem;">
            <h2>Support</h2>
            <p>Need for support? If you cannot find your answer here, contact us for further help.</p>
            <a href="#">MyClavister Helpdesk</a><br />
            <phone>+46 (0)660 – 29 77 55</phone>
        </div>
    </div>
</div>

<!-- 
# All articles

{% assign articles = site.pages | where: "layout", "article" %}
{% for page in articles %}
* [{{page.title}}]({{page.url}})  <small>{{page.tags}}</small>
{% endfor %} -->
