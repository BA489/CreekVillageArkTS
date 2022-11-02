/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { COMMON_NUM_MINUTE, COMMON_NUM_DOUBLE, ZERO_STR, SPLIT } from '../common/constants/CommonConstants';

/**
 * video component prepared callback
 */
export function prepared(event) {
  this.durationTime = event.duration;
  let second: number = event.duration % COMMON_NUM_MINUTE;
  let min: number = parseInt((event.duration / COMMON_NUM_MINUTE).toString());
  let head = min < COMMON_NUM_DOUBLE ? `${ZERO_STR}${min}` : min;
  let end = second < COMMON_NUM_DOUBLE ? `${ZERO_STR}${second}` : second;
  this.durationStringTime = `${head}${SPLIT}${end}`;
};

/**
 * video component finish callback
 */
export function finish() {
  this.isPlay = false;
  this.isOpacity = false;
};

/**
 * video component onclick callback
 */
export function videoOnclick() {
  if (!this.isPlay) {
    this.controller.start();
    this.isPlay = true;
    this.isOpacity = true;
  } else {
    this.controller.pause()
    this.isPlay = false;
    this.isOpacity = false;
  }
};

/**
 * video slider component onchange callback
 */
export function sliderOnchange(value: number, mode: SliderChangeMode) {
  this.currentTime = parseInt(value.toString());
  this.controller.setCurrentTime(parseInt(value.toString()), SeekMode.Accurate);
  if (mode === SliderChangeMode.Begin) {
    this.isOpacity = false;
  }
  if (mode === SliderChangeMode.Moving) {
    this.isOpacity = false;
  }
  if (mode === SliderChangeMode.End) {
    this.isOpacity = true;
  }
};

/**
 * get video  string of current time
 * @param  the number of current time
 * @return the string of current time
 */
export function changeSliderTime(value: number): string {
  let second: number = value % COMMON_NUM_MINUTE;
  let min: number = parseInt((value / COMMON_NUM_MINUTE).toString());
  let head = min < COMMON_NUM_DOUBLE ? `${ZERO_STR}${min}` : min;
  let end = second < COMMON_NUM_DOUBLE ? `${ZERO_STR}${second}` : second;
  let nowTime = `${head}${SPLIT}${end}`;
  return nowTime;
};

/**
 * icon onclick callback
 */
export function iconOnclick() {
  this.controller.start();
  this.isPlay = true;
  this.isOpacity = true;
};