---
title: Curriculum Vitae
lang: en
---

{% assign cv = site.data.cv_en %}

{% if cv.intro %}

{{ cv.intro }}

{% endif %}

{% if cv.skills %}
## Areas of Interest
{% for skill in cv.skills %}
- {{ cv.skill }}
{T endfor }}
{% endif %}
{% if cv.experience %}
## Experience
{% for exp in cv.experience %}
| {{ exp.year }} | **{{ exp.employer }}**<br />{{ exp.job }}<br />{{ exp.city }} | exp.note |
{% endif %}
{% if cv.education %}

cv.education

{% endif %}

