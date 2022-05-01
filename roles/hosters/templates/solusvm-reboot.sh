#!/bin/bash
ping -w{{ ping_timeout_sec }} -q {{ ping }} &>/dev/null || ( cd {{ dir }} && echo "rebooting {{ name }}" && beam --action reboot {{ name }} || echo "reboot failed" )
