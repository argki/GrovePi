#!/usr/bin/env bash
update_grovepi_firmware(){
	avrdude -c linuxgpio -p m328p -U lfuse:w:0xFF:m
	avrdude -c linuxgpio -p m328p -U hfuse:w:0xDA:m
	avrdude -c linuxgpio -p m328p -U efuse:w:0x05:m
	avrdude -c linuxgpio -p m328p -U flash:w:grove_pi_firmware.hex
}
