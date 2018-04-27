/*
 * Copyright (c) 2016 RedBear
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

/**
 * @note This demo is Nordic HRM example.
 *       You could use nRF toolbox tool to test it.
 */
#include <nRF5x_BLE_API.h>
#include <Wire.h>
#include "I2Cdev.h"
#include "MPU6050_6Axis_MotionApps20.h"

#define DEVICE_NAME       "Nordic_HRM"

BLE                       ble;
Ticker                    ticker_task1;
Ticker      ticker_get_acc;
MPU6050 accelgyro;

uint8_t hrmCounter = 100;

uint8_t ax1, ax2, ay1, ay2, az1, az2, gx1, gx2, gy1, gy2, gz1, gz2;
static uint8_t bpm[12];
//static uint8_t bpm[2] = {0x00, 0x01};
static const uint8_t location = 0x03;

static const uint16_t uuid16_list[] = {GattService::UUID_HEART_RATE_SERVICE};

// Create characteristic and service
GattCharacteristic   hrmRate(GattCharacteristic::UUID_HEART_RATE_MEASUREMENT_CHAR, bpm, sizeof(bpm), sizeof(bpm), GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_NOTIFY);
GattCharacteristic   hrmLocation(GattCharacteristic::UUID_BODY_SENSOR_LOCATION_CHAR,(uint8_t *)&location, sizeof(location), sizeof(location),GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_READ);
GattCharacteristic   *hrmChars[] = {&hrmRate, &hrmLocation, };
GattService          hrmService(GattService::UUID_HEART_RATE_SERVICE, hrmChars, sizeof(hrmChars) / sizeof(GattCharacteristic *));



int16_t ax, ay, az;
int16_t gx, gy, gz;


void disconnectionCallBack(const Gap::DisconnectionCallbackParams_t *params) {
  Serial.println("Disconnected!");
  Serial.println("Restarting the advertising process");
  ble.startAdvertising();
}

void get_acc_values(){
  //digitalWrite(13, HIGH);
  //delay(3000);
  accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
  //digitalWrite(13, LOW);
  
}

void periodicCallback() {
  if (ble.getGapState().connected) {
    //accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
    //ax2 
     bpm[1] = (uint8_t)(ax & 0xFF); //LSByte
 //     bpm[0] = 0xAA;
//    //ax1 
     bpm[0] = (uint8_t)(ax >> 8); //MSByte
//
//    //ay2 
    bpm[3] = (uint8_t)(ay & 0xFF); //LSByte
//    //ay1
    bpm[2]= (uint8_t)(ay >> 8); //MSByte
//
//    //az2 
    bpm[5] = (uint8_t)(az & 0xFF); //LSByte
//    //az1 
    bpm[4] = (uint8_t)(az >> 8); //MSByte
//
//    //gx2 
    bpm[7] = (uint8_t)(gx & 0xFF); //LSByte
//    //gx1 
    bpm[6] = (uint8_t)(gx >> 8); //MSByte
//
//    //gy2 
    bpm[9] = (uint8_t)(gy & 0xFF); //LSByte
//    //gy1 
    bpm[8] = (uint8_t)(gy >> 8); //MSByte
//
//    //gz2 
    bpm[11] = (uint8_t)(gz & 0xFF); //LSByte
//    //gz1 
    bpm[10] = (uint8_t)(gz >> 8); //MSByte

    
    //bpm[1] = hrmCounter;
    ble.updateCharacteristicValue(hrmRate.getValueAttribute().getHandle(), bpm, sizeof(bpm));
  }
}

void setup() {
  // put your setup code here, to run once
  Serial.begin(9600);
  Serial.println("Nordic_HRM Demo ");
   #if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
    Wire.begin();
  #elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
    Fastwire::setup(400, true);
  #endif

    Serial.println("Initializing I2C devices...");
    accelgyro.initialize();
  // Init timer task
  //ticker_task1.attach(periodicCallback, 0.4);
  //ticker_get_acc.attach(get_acc_values, 0.5);
  // Init ble
  ble.init();
  ble.onDisconnection(disconnectionCallBack);

  // setup adv_data and srp_data
  ble.accumulateAdvertisingPayload(GapAdvertisingData::BREDR_NOT_SUPPORTED | GapAdvertisingData::LE_GENERAL_DISCOVERABLE);
  ble.accumulateAdvertisingPayload(GapAdvertisingData::COMPLETE_LIST_16BIT_SERVICE_IDS, (uint8_t*)uuid16_list, sizeof(uuid16_list));
  ble.accumulateAdvertisingPayload(GapAdvertisingData::HEART_RATE_SENSOR_HEART_RATE_BELT);
  ble.accumulateAdvertisingPayload(GapAdvertisingData::COMPLETE_LOCAL_NAME, (uint8_t *)DEVICE_NAME, sizeof(DEVICE_NAME));
  // set adv_type
  ble.setAdvertisingType(GapAdvertisingParams::ADV_CONNECTABLE_UNDIRECTED);
    // add service
  ble.addService(hrmService);
  // set device name
  ble.setDeviceName((const uint8_t *)DEVICE_NAME);
  // set tx power,valid values are -40, -20, -16, -12, -8, -4, 0, 4
  ble.setTxPower(4);
  // set adv_interval, 100ms in multiples of 0.625ms.
  ble.setAdvertisingInterval(160);
  // set adv_timeout, in seconds
  ble.setAdvertisingTimeout(0);
  // start advertising
  ble.startAdvertising();
 

    //verify connection
    Serial.println("Testing connection to I2C");
}

void loop() {
  // put your main code here, to run repeatedly:
  ble.waitForEvent();
//  digitalWrite(13, HIGH);
//  //delay(3000);
//  get_acc_values();
//  delay(1000);
//  digitalWrite(13, LOW);
//  delay(1000);
accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
periodicCallback();
  
}

