#ifndef COMMON_H_
#define COMMON_H_

extern const int ANALOG_MAX;

extern long lastSerialOutputTime; // Milliseconds
extern long serialOutputIntervalInSeconds;

extern bool isDebugMode;

void EEPROMWriteLong(int address, long value);
long EEPROMReadLong(int address);

long secondsToMilliseconds(int seconds);
float millisecondsToSecondsWithDecimal(int milliseconds);

void forceSerialOutput();

#endif
/* SOILMOISTURESENSOR_H_ */
