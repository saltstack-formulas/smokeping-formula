{% from "smokeping/map.jinja" import smokeping with context %}

smokeping:
  pkg.installed:
    - name: {{ smokeping.lookup.pkg }}

  service.running:
    - name: smokeping
    - enable: True
