{% if cv.intro %}
{{ cv.intro }}

{% endif %}

{% if cv.skills %}
| | **{{ cv.title_skills }}**
{% for skill in cv.skills %}| | <span style="text-align: center; display: inline-block; font-size: 3em;"><i class="fas fa-{{ skill.icon }}"> </i> </span> |  {{ skill.desc }}
{% endfor %}{% endif %}{% if cv.education %}| | **{{ cv.title_education }}**
{% for edu in cv.education %}| {{ edu.year }} | **{{ edu.subject }}**,<br />*{{ edu.degree }}*,<br />{{ edu.institute }},<br />{{ edu.city }} | {{ edu.note }}
{% endfor %}{% endif %}{% if cv.experience %}| | **{{ cv.title_experience }}**
{% for exp in cv.experience %}| {{ exp.years }} | **{{ exp.employer }}**<br />{{ exp.job }}<br />{{ exp.city }} | {{ exp.note }} |
{% endfor %}{% endif %}{% if cv.other %} | | **{{ cv.title_other }}**
{% for misc in cv.other %}| | {{ misc.topic }} | {{ misc.info }}
{% endfor %} {% endif %}
