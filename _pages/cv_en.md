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
## {{ cv.title.skills }}
{% for skill in cv.skills %}- {{ skill }}
{% endfor %}{% endif %}
{% if cv.experience %}| **{{ cv.title.experience }}**
{% for exp in cv.experience %}| {{ exp.years }} | **{{ exp.employer }}**<br />{{ exp.job }}<br />{{ exp.city }} | {{ exp.note }} |
{% endfor %}{% endif %}{% if cv.education %}| **{{ cv.title.education }}**
{% for edu in cv.education %}| {{ edu.year }} | **{{ edu.subject }}**,<br />*{{ edu.degree }}*,<br />{{ edu.institute }},<br />{{ edu.city }} | {{ edu.note }}
{% endfor %}
{% endif %}

[Download PDF](/assets/pdf/cv_en.pdf)
