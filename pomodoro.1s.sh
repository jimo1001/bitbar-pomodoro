#!/bin/bash
#
# <bitbar.title>bitbar-pomodoro</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Yoshinobu Fujimoto</bitbar.author>
# <bitbar.author.github>jimo1001</bitbar.author.github>
# <bitbar.desc>Pomodoro Technique for BitBar</bitbar.desc>
# <bitbar.image>https://raw.githubusercontent.com/jimo1001/bitbar-pomodoro/master/screenshot.png</bitbar.image>

# 25 min
POMODORO_TIME=$((25 * 60))
# 5 min
SHORT_BREAK_TIME=$((5 * 60))
# 15 min
LONG_BREAK_TIME=$((15 * 60))

CALENDAR="Pomodoro"

STATE_FILE=$TMPDIR/bitbar-pomodoro
MENUBAR_IMAGE="iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAABBNJREFUWAm1V11oXEUUPmfm7qax/pAEawib7N5m24Cp9SFIhUJRUEGsFEF8KSr6Zh98qw9CxVpQqD9QBR8EH0Qsoj5IH3wTYq1WkSjEH5qY/c2m1JZGWmzT7N47xzPpzmXu3Xs32W52IMyZ8/Odb86emTtB6GC4rnuPbPizIMVQbJiCS45q7Dq3tHQ51h6jFDG6RFUKYJiTb2MHGfsnYNiTcjgRIMbQEYE7Bgf/QqB3lFKNKJbWEcLxTHX7XNTWbo3tjEm2fDa3TAArHPyv9mF5gOX+hUp50MRMZjKDN6R8YbTinpiGac/oN2XO5/N9UaBMJtNv67Zns18yUcpns79MuO6EbbPljiowMTo6oqR8koj2KoCdAnFtx4pomeU5UviDL+hUuVy+uCOXe558/3UQcowTXuc6HV6oVD60k2t5QwTGx8am2PEIoNjPMboB2w0fFZxirzeu1evz/en0W0jw8s0A+pRJPGcHO/YiKudyuS0O0dvM8xDbkhqWdwe3WbGSBDzFjXGAk3+AjvMKed5Z8tUnQoqzlt+amFiB8fHxbeipb7h0U9Ege82Nh7rh6iI15SM9Lnx1sHlU19wU0M9Oo2+/Sq2O8u5/s2O1HEtAA65K5zTbJ6MB0bUmYOuaVTvEPXJUAN6ubXx0Z30p9xWLxSu2r5bjyoqrjvM529ZNHgXTa27AG7zT90DKKSZR0DoC3I0+fcZiiKy2tRDgY/MSRzyqjd0M3u18Svn7mMSSxuEqPMHYL0YxQwQm757kkuGxqNOtrucWF88LhINBvE9vjoyM2A0brkC9/5pmGNxmQWAXwkK5/B034ldrEPwd2ZpOh45hqAKE9GwXuZJDSZ4wRiII5QgI6M7n8rc9cgak07lYLZ4Bpf5pxu3hq/xOgxEQ4A/H/axs6VLj2PUsxekmhqR6/T6DFxAAxDGj7MlM+LfBFUIEuYKrmLce6k7jvN68I+seBuKXQLuByD893Wtc2H2rkW0CK/xd73gw8PH1f7gosloxiYKfAJWoGWWvZxRi0eQICPgpnDXKHs+UbjT+MDkCAoVC4SKX8ndj6N2Mv/5Zqy0b/IBAU3HSGHo3q1COEIE+z/uIr83/epZcqSv8pPvYxg89ry5dvboyNDCgW/YR22nTZIGvFkqlaRsvVAFtuGto6F1S8JPttBky3xTf84fp/ShWC4GZmZmGJO9pUH416nyra34TlHyAZziep/BoIaDN87XakhTiIX7LLOh1V8OHcyTwYX4pXYjDiSWgHecqlZKH+AAfzS/iAjekU3AStjh7SqVSJcm//R3ejMq77mPk0VEU8GASUET/oyL1WrFa/Taib1luiICJcl13t6PgAJG/V6HYyd/4m/+mC3FZkJpHlGeUEl8XFgvBTWdik+b/AR+iU4R6nh7vAAAAAElFTkSuQmCC"
START_IMAGE="iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAAANVJREFUWAnt1j0OgkAQBWBi4gE8hx4C/0qva+ldKO1o0E59L9FkQ4CZNXlDjDvJNGTgfTtQUFWlygZ+ZANLOC/oK/o4h3mN0Oe773MgNgmAECIO6LDqA8IRQ4BQxBggDDEF+CD2yg/CAsgRHgARN7RkE16ADJEDIKJDr9BmLcyJ7wYeuI0QsxQAfgcndGumZwx4XwFXX2c81z3qAcjCqbQAXHvNQVVNAeThPNQYgOFb1anT5w4BwsIJ6QNCwwlIf8kYvuPFyOJP6RndoMPDIw9asv5wAy83wY10RDBTiAAAAABJRU5ErkJggg=="
SHORT_BREAK_IMAGE="iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAABBhJREFUWAm9V0FoXFUUvff9yTRJxSZNLTTJzP+ZmZqUuKkBLVoKEQQVoaDooroWXOiiXdVaFEHciF10JVrdqZsqQkvdiKCoIIWClZJpJpOZSRTFJs3YRRNn/rueN9P3mWkn//9JTP5i3vv3nnvunffuu/d9hzb5HHDdffcPDM7sGdj153K1erVbukQXBpxz3UPEvFeI2NrVND2qmEa0qJ1W1s0YK4BsNpvSa/7XID5Ird6NJ4Sitf6Hpee7bhxbbKwAVL3+GTt8kEnOaqIvmBlD81GY/ys0W1mYu2ll3YzBUq5nlBvJjVKivgCP88VyKbMebqNyFWXoJGo9BqM09U1OTiaj8N3qI1fAEGZT3jVWdECL/t5h54Kw1EIcGc4iJRLfFAqFtRBcQxUrAGT/w+TLJXLU3ihCq0e+/Oo7zpFisVi1sk5jrACMYSaT2cV1OUqsc4rUuluncRxY5Bkcj4eY+N3Z8vybnRxvqcysWM71BFv3c5Sjdf9JlGGE/pDRs0O3InAUqw4Ykv2u+zxq0FGch/5QUpHd0B8xGOzvp6FYKGMFkHXdE0L8fpMMYYQ9Jqs0rZJDp2dLpc/DoEYXJwlVLpVeRt4huegNrSgfRgrCVa3UlajsD+No05nik3HdWi7lnWtTbOdLLp2e9DxvYDt9bpuvIAempqZ6qktLjyPFerfSu/jqRnGheNn6CALIed7b6PVvWcWWjkzHC6XSGeMjOIYsnBBz28CjSW6gz38gwmFNp4GN88Okk2jnJxXxfQYvzVrRMA0CEMHxurMecH4FEb4XhzwuBomMPsKPGDzczFi7oBQr8n+0Ql8oa+f/1+izCjgdop8sbxDA9UqliGW6ZhQAZMZTqWEL2uz4oOdNgHOoySO/5cvlecsZBGAEiiQoNujlL1rQZkfk0gsBB/MnwRyTtgCc3t6PfKIlA9BCr5uj2QreyHx0dLQPSf1qg5Pkb2fHjo9bedoCyOfztxJMjQsEFGOoCydawRuZ9zk9p5B0+4wtizplfLTyBHWgRcio+xexNk/jvl9jpum5SiVI0BZc5HR/euxJ3B8vAeigm16cK88/e7dR2wrcUUrdoWM4K1dVowOqC2jHj91tGPUOm2mf9ZfAOYZLHH6pkw2S895nZWVldXBo6Dw+P56AcUa0vLx7cOD2zWr1F6Cb1epes4bE5E1/MnkSoHMoPCjrclkSiafQnpc7mXTaggA3PDzcvzOZPIMi9UpDyDQrms+y73xV+L2wGAAxmUC7rIs8B/1ruMJ7EKHg0Ydrun58cXHxdiu2dR4agAVm0pnDivQ7WI1pK8MH4V++qD/gDJdfGcHwgNVB8K2QPl0olyMvpbECsMTjY2PjPv4ltuZwnWmCtd7T0Cm1hC+nGez2D7gNncdyX7c2UeN/KW1A1Rlq9MYAAAAASUVORK5CYII="
LONG_BREAK_IMAGE="iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAABc9JREFUWAm1VmtoXEUUnjP37iZNo61NajXdZB/ZdIUFn4il6J+Iom0FHwgVf/ijihV8gC0qttonSn4Uf0mLVipUKlpEEFREWvBHsRYKtiWFpJtNdhNL1doktnns487xOzfe5ebubhIkDlxm5sx5zZlzv3NILXCkUqkbTKGwkZm7ieiOMqsEGXOjK65p3CIaxNlZJjpuNzR829fXd20hqmk+pkQisUY75i3wbcK3xOM3iv/URGOyN8zLtaKV3hnmSaX4KDt2z8DIQMZHr1rWdSASiSxppNBeo81rUG4rx/zBtv4ct//OEP2SzWbH/drg6DJtzFpi3uDAWXHIGFMiS3+A/c6hoaFpP7+3rulAIpLo0pb5GkxpMUy23sm2fTiTyRQ8wbnmWCzWaDNvNkrtgiOtpPgcG/NkZnh4IChX5UAyGr0Lgj+4ISV1rGjMi/l8fjQouJB9OhJZUST7EGv1hDLmd8e2Hh4cHDznl53lgNxcWc5J1zirXZn80G4/839dd0aje0nRDmXUZUvzur5cbtDTVXGgra2tqSkUPo2DtFqA8WQyuZLK5afAz1QMf9V/qf+Kp7TW3BWN72PF2w2rX3XYXus9p/aYm6yGPVinFcI+381T8XjKlEoXmNUBfAfLocKFzkhn0tNVa76YG9wB3d9oUneqYnmnx+M6IL+aZLsknLy5d1hvdox6R5LLO3efTDvbvX29WRfDm3F21bDZmopG48LnOiD/OZTYku0LSTgm7ggaIVJVtCCPPBOx2qO1DpeZ33QdwFsKmm2a+c/tw0GhWnvN9GMVnVQ1rYpJqSlT/gjkq0DMZyXvNBJpAwhLBGS8xKghN4sUbm7qMYo+ARqWBWyQhx8va2nZP4upzmZkZGQKefMlIt68NBR6FHjB3QrZIQhXR6aK3NvbWwTxeQDOy8oilRWUy+Wq+OoRYA22eIujdLcthQUeKYHXegJ++kxtcHaw0ivwu7qjqyNGCOmosehtQHTez19zHbZOqVJZWcrcTvFo7Aqg0mRzuZtrMvuIt61e3VKyQ+cBHrf6yP5lrwrZ9yzkKZPtHWOs9YSWkupVNb+mWutyKHRgDuMikqZSaV8t2SANERyFLlRRDHZUOcgQ3HfFYs8g5E8H6cE9K9ra1RF/KEgP7kmza1MrNBOkzIogg3+fam9vQ5586KfNsUZFdo4gQW+Zg0eSrhUpNKalk1Far/oXD6pk0ul02NHWERzcVHVYjwB9IeZj0kXVYlnTtqYVEIjwc1ZLG+UyOc7aALPujMUeL1yf+Bl0/KoYxpkvw1kATVjxFPc7E1PnUd43yyWE5g22y64t5MFZgBodlwMk40aZBZ0g9HoiGssANqUpuVvoAJ0RgMV6WdcbAKUicOERnE+5PJaOQvOhqesT2c5ofJt0WS5dm8dkxtOfIAmTM124DAOTwIJ2G10M3Hdx2mU2Zhxt1RfacXYXLGvSZlW3OYEDhexwvhH1vxvAsA8W5KZI9pmBcrxt6fT0wclww2+GlEbhW6Vnulc+KtXNMvQCbnnCEwA8nGZSD14cGtrSNzx8qUKfZzGQy51ASX8AsuvRXVXaMDbWTxONTS8h55Zp0p8JLLveSS1nQn3X+m8g635E4L2AjVG8wSn8Ohm87SuBM/8WgVQ9qJb3Irfug5HZSUhqN85fRaSa2LZSaM9ylfAg4Xrw5m9AmwBshe7XvghrVzeeYi+i9K7oc4FIFtI6S/eK5f9lXMxAN51pbG6uoOUsY8n29k4wnBRcEO7FHrj+JaNpnYTe012JgBCkb5fWWbpXj2GxZjFObKQtrxgX3bMcEIL07dI6S/cq+8UZdEZunsnne4P6rCBB9n+Nj4+1rGz9FKhmoYG8Dz1DTb5asn6a4AJe/f3G5qXP9ff3X/WfeetZOeAR/bN0r9JASg8nbZT/rN4aTl+T/9zR1BMMeVBmXgc8AYFo6eGkjZJOBj1hAsLL5RzvOyaFRbBd4HXKcb4XkPFk55r/Ab3iZror4J9UAAAAAElFTkSuQmCC"
CANCEL_IMAGE="iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAAAIpJREFUWAljYBgFIz0EGHEEgARQXASHHLnCb4AaXxCjGWT5DyD+T2X8HWieKBCjACYUHoQD8jk7FnFKhTiABgijG4LNAehqaMofdcBoCIyGwGgIjIbAaAiMhsBoCIyGALYQALVeQY1SaoNvQANBZqMAXM1yUOsVowGJopN0DshyDAeQbsyojuEWAgBj7R4xxN5w/AAAAABJRU5ErkJggg=="

FONT_FAMILY="Monaco"
FONT_SIZE=10

# UNIX time
CURRENT_TIME=$(date +%s)

STATE="$CURRENT_TIME|0||"

if [ -f "$STATE_FILE" ]; then
    STATE=$(cat "$STATE_FILE")
fi

TIME=$(echo "$STATE" | cut -d "|" -f1)
STATUS=$(echo "$STATE" | cut -d "|" -f2)
REMINDER_URI=$(echo "$STATE" | cut -d "|" -f3)
REMINDER_TITLE=$(echo "$STATE" | cut -d "|" -f4)

function changeStatus {
    echo "$CURRENT_TIME|$1|$REMINDER_URI|$REMINDER_TITLE" > "$STATE_FILE";
}

function notify {
    osascript -e "display notification \"$1\" with title \"$MENUBAR_LOGO Pomodoro\"" &> /dev/null
}

function dialog {
    osascript -e "display alert \"$1\" message \"$2\""
}

function getReminderTitle {
    if [ ! -n "$REMINDER_TITLE" -a -n "$REMINDER_URI" ]; then
        REMINDER_TITLE=$(osascript -lJavaScript -e "Application('Reminders').reminders.byId(\"$REMINDER_URI\").name()")
        changeStatus $STATUS
    fi
    echo $REMINDER_TITLE
}

function startShortBreak {
    changeStatus "2"
    notify "Start short break"
}

function startLongBreak {
    changeStatus "3"
    notify "Start long break"
}

function finishBreak {
    changeStatus "0"
    notify "Break time is finished"
}

function startPomodoro {
    changeStatus "1"
    notify "Start Pomodoro\n$(getReminderTitle)"
}

function stopPomodoro {
    changeStatus "0"
    notify "Stop Pomodoro"
}

case "$1" in
"work")
    startPomodoro
    exit
  ;;
"s_break")
    startShortBreak
    exit
  ;;
"l_break")
    startLongBreak
    exit
  ;;
"cancel")
    changeStatus "0"
    notify "Pomodoro cancelled"
    exit
  ;;
esac

function timeLeft {
    local FROM=$1
    local TIME_DIFF=$((CURRENT_TIME - TIME))
    local TIME_LEFT=$((FROM - TIME_DIFF))
    echo "$TIME_LEFT";
}

function getSeconds {
    echo $(($1 % 60))
}

function getMinutes {
    echo $(($1 / 60))
}

function displayTime {
    SECONDS=$(getSeconds "$1")
    MINUTES=$(getMinutes "$1")
    printf "%02d:%02d|image=$MENUBAR_IMAGE font=$FONT_FAMILY size=$FONT_SIZE trim=false color=%s\n" "$MINUTES" "$SECONDS" "$2"
}

case "$STATUS" in
"0")
    displayTime "0" "black"
  ;;
"1")
    TIME_LEFT=$(timeLeft $POMODORO_TIME)
    if (( "$TIME_LEFT" < 0 )); then
        if [ -n "$REMINDER_URI" ]; then
            osascript -lJavaScript <<EOF
// Reminders.app
var rApp = Application("Reminders");
var r = rApp.reminders.byId("$REMINDER_URI");
r.body = "🍅" + (r.body() || "");

// Calendar.app
var cApp = Application("Calendar");
var e = new cApp.Event({
    summary: "$(getReminderTitle)",
    startDate: new Date($TIME * 1000),
    endDate: new Date()
});
cApp.calendars.byName("$CALENDAR").events.push(e);
EOF
        fi
        dialog "Pomodoro Work is Finished." "Please Take a Short Break."
        startShortBreak
    fi
    displayTime "$TIME_LEFT" "black"
  ;;
"2")
    TIME_LEFT=$(timeLeft $SHORT_BREAK_TIME)
    if (("$TIME_LEFT" < 0)); then
        finishBreak
    fi
    displayTime "$TIME_LEFT" "green"
  ;;
"3")
    TIME_LEFT=$(timeLeft $LONG_BREAK_TIME)
    if (("$TIME_LEFT" < 0)); then
        finishBreak
    fi
    displayTime "$TIME_LEFT" "green"
  ;;
esac

echo "$(getReminderTitle)"
echo "---"
echo "Start Pomodoro|image=$START_IMAGE bash=$0 param1=work terminal=false"
echo "Short Break|image=$SHORT_BREAK_IMAGE bash=$0 param1=s_break terminal=false"
echo "Long Break|image=$LONG_BREAK_IMAGE bash=$0 param1=l_break terminal=false"
echo "Cancel|image=$CANCEL_IMAGE bash=$0 param1=cancel terminal=false"
