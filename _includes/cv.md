{% if cv.intro %}

{{ cv.intro }}

{% endif %}

{% if cv.skills %}
## {{ cv.title_skills }}
{% for skill in cv.skills %}- {{ skill }}
{% endfor %}{% endif %}
{% if cv.experience %}| **{{ cv.title_experience }}**
{% for exp in cv.experience %}| {{ exp.years }} | **{{ exp.employer }}**<br />{{ exp.job }}<br />{{ exp.city }} | {{ exp.note }} |
{% endfor %}{% endif %}{% if cv.education %}| **{{ cv.title_education }}**
{% for edu in cv.education %}| {{ edu.year }} | **{{ edu.subject }}**,<br />*{{ edu.degree }}*,<br />{{ edu.institute }},<br />{{ edu.city }} | {{ edu.note }}
{% endfor %}
{% endif %}

