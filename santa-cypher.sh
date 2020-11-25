#! /bin/bash

if [[ -z $1 ]]; then
  echo No no no. Run it like this:
  echo "$0" \"Some text you want to encode.\"
  exit 1
fi

declare -A CYPHER

CYPHER[A]=HoHO
CYPHER[B]=HOHoHoHo
CYPHER[C]=HOHoHOHo
CYPHER[D]=HOHoHo
CYPHER[E]=Ho
CYPHER[F]=HoHoHOHo
CYPHER[G]=HOHOHo
CYPHER[H]=HoHoHoHo
CYPHER[I]=HoHo
CYPHER[J]=HoHOHOHO
CYPHER[K]=HOHoHO
CYPHER[L]=HoHOHoHo
CYPHER[M]=HOHO
CYPHER[N]=HOHo
CYPHER[O]=HOHOHO
CYPHER[P]=HoHOHOHo
CYPHER[Q]=HOHOHoHO
CYPHER[R]=HoHOHo
CYPHER[S]=HoHoHo
CYPHER[T]=HO
CYPHER[U]=HoHoHO
CYPHER[V]=HoHoHoHO
CYPHER[W]=HoHOHO
CYPHER[X]=HOHoHoHO
CYPHER[Y]=HOHoHOHO
CYPHER[Z]=HOHOHoHo

CYPHER[HoHO]=A
CYPHER[HOHoHoHo]=B
CYPHER[HOHoHOHo]=C
CYPHER[HOHoHo]=D
CYPHER[Ho]=E
CYPHER[HoHoHOHo]=F
CYPHER[HOHOHo]=G
CYPHER[HoHoHoHo]=H
CYPHER[HoHo]=I
CYPHER[HoHOHOHO]=J
CYPHER[HOHoHO]=K
CYPHER[HoHOHoHo]=L
CYPHER[HOHO]=M
CYPHER[HOHo]=N
CYPHER[HOHOHO]=O
CYPHER[HoHOHOHo]=P
CYPHER[HOHOHoHO]=Q
CYPHER[HoHOHo]=R
CYPHER[HoHoHo]=S
CYPHER[HO]=T
CYPHER[HoHoHO]=U
CYPHER[HoHoHoHO]=V
CYPHER[HoHOHO]=W
CYPHER[HOHoHoHO]=X
CYPHER[HOHoHOHO]=Y
CYPHER[HOHOHoHo]=Z

input=$1
input=$(echo "$input" | tr '\n' ' ')
break_char=🎅

# checks if the input is already encoded
is_hohoho() {
  stripped=$(echo "$input" | tr -cd "$break_char"".!? "HOho)
  [ "$input" = "$stripped" ]
}

# encodes to ho ho ho
to_hohoho() {
  input=$(echo "$input" | tr '[:lower:]' '[:upper:]' | tr -cd '[:alnum:][:space:].!?')
  output=""

  for ((i = 0; i < ${#input}; i++)); do
    char=${input:$i:1}
    if [[ -v "CYPHER[$char]" ]]; then
      output="$output"${CYPHER[$char]}$break_char
    else
      output="$output"$char
    fi
  done

  echo "$output"
}

# unencodes from hohoho
to_text() {
  output=""

  while [ -n "$input" ]; do
    # if char is !hoHO🎅
    char=${input:0:1}
    if [[ $char =~ (H|O|h|o|🎅) ]]; then
      string=$(echo "$input" | awk -F🎅 '{print $1}')
      match="${CYPHER[$string]}"
      output="$output""$match"
      chars_to_remove=$((${#string} + 1))
      input="${input:$chars_to_remove}"
    else
      output="$output"$char
      input="${input:1}"
    fi
  done

  echo "$output"
}

if is_hohoho; then
  to_text
else
  to_hohoho
fi
