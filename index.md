<h1>Welcome to Clavister Knowledge Base</h1>

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

<div class="d-flex justify-content-bwteen" markdown="0">
    <div>
        <h2>Latest Articles</h2>
{% assign articles = site.pages | where: "layout", "article" | sort: "last_modified_at" | reverse %}
{% for article in articles limit: 10 %}
<div class="mb-3 pb-1 border-bottom"><a href="{{article.url}}">{{article.title}}</a><br /><small class="text-muted"><b>{{ article.last_modified_at | date: "%e %b, %Y"}}</b></small> <small>{{article.tags}}</small></div>
{% endfor %}
    </div>
    <div class="ml-4" style="max-width: 400px;" markdown="0">
        <div class="p-2">
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
                <span class="px-2"><a href="/tags/{{t}}" style="font-size: {{counter | times: 4 | plus: 80}}%;">{{t}}</a></span>
            {% endfor %}
            </div>
        </div>
        <div class="mt-4 p-2 border" style="background-color: #e9ecef;">
            <h2>Support</h2>
            <p>Need for support? If you cannot find your answer here, contact us for further help.</p>
            <a href="https://my.clavister.com/help-desk/" target="_blank">MyClavister Helpdesk</a><br />
            <phone>+46 (0)660 – 29 77 55</phone>
        </div>
    </div>
</div>

<script src="/assets/js/simple-jekyll-search.min.js" type="text/javascript"></script>
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