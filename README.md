# Santa Cypher

A silly encrypter that converts (poorly) between text and Santa laughing.

## Example

GIVEN `santa`
RETURN `HoHoHo🎅HoHO🎅HOHo🎅HO🎅HoHO🎅`

GIVEN `HoHoHo🎅HoHO🎅HOHo🎅HO🎅HoHO🎅`
RETURN `SANTA`

## Usage

### Encode

`echo my secret message | ./santa-cypher.sh`

`HOHO🎅HOHoHOHO🎅 HoHoHo🎅Ho🎅HOHoHOHo🎅HoHOHo🎅Ho🎅HO🎅 HOHO🎅Ho🎅HoHoHo🎅HoHoHo🎅HoHO🎅HOHOHo🎅Ho🎅`

### Decode

`echo HOHO🎅HOHoHOHO🎅 HoHoHo🎅Ho🎅HOHoHOHo🎅HoHOHo🎅Ho🎅HO🎅 HOHO🎅Ho🎅HoHoHo🎅HoHoHo🎅HoHO🎅HOHOHo🎅Ho🎅| ./santa-cypher.sh`

`MY SECRET MESSAGE`

## Website

santa-cypher.tomontheinternet.com
