---
title: Curriculum Vitae
permalink: /cv-en/
lang: en
read_time: false
related: false
---
{% assign cv = site.data.cv_en %}

{% if cv.intro %}

{{ cv.intro }}

{% endif %}

{% if cv.skills %}
| <h2>Areas of Interest</h2>
{% for skill in cv.skills %}| | {{ skill }}
{% endfor %}{% endif %}{% if cv.experience %}| <h2>Experience</h2>
{% for exp in cv.experience %}| {{ exp.years }} | **{{ exp.employer }}**<br />{{ exp.job }}<br />{{ exp.city }} | {{ exp.note }} |
{% endfor %}{% endif %}{% if cv.education %}| <h2>Education</h2>
{% for edu in cv.education %}| {{ edu.year }} | **{{ edu.subject }}**,<br />*{{ edu.degree }}*,<br />{{ edu.institute }},<br />{{ edu.city }} | {{ edu.note }}
{% endfor %}
{% endif %}

