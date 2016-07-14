{% from "smokeping/map.jinja" import smokeping with context %}

include:
  - smokeping

smokeping_cfg:
  file.managed:
    - name: /etc/smokeping/config
    - source: salt://smokeping/files/config
    - template: jinja
    - user: root
    - watch_in:
      - service: smokeping
    - require:
      - pkg: smokeping

{% for config in ['General', 'Database', 'Alerts', 'Targets', 'Presentation', 'Probes', 'pathnames'] %}
smokeping_config_d_{{config}}:
  file.managed:
    - name: /etc/smokeping/config.d/{{ config }}
    - source: salt://smokeping/files/{{ config }}
    - template: jinja
    - user: root
    - watch_in:
      - service: smokeping
{% endfor %}    
