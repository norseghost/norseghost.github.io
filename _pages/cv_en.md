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
{{% endfor %}
{% endif %}
{% if cv.experience %}
## Experience
{% for exp in cv.experience %}
| {{ exp.year }} | **{{ exp.employer }}**<br />{{ exp.job }}<br />{{ exp.city }} | exp.note |

{{% endfor %}
{% endif %}
{% if cv.education %}
## Education
{% for edu in cv.education %}
| {{ edu.year }} | **{{ edu.subject }}**, *{{ edu.degree }}*,<br />{{ edu.institute }}, {{ edu.city }} | {{ edu.note }}

{{% endfor %}
{% endif %}

