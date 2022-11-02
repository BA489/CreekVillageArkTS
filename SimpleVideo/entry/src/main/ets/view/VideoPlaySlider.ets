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

import { sliderOnchange } from '../model/VideoControll';
import {
  ALL_PERCENT,
  MARGIN_FONT_SIZE,
  SMALL_TRACK_THICK_NESS,
  DEFAULT_OPACITY,
  STRING_PERCENT,
  BIG_TRACK_THICK_NESS
} from '../common/constants/CommonConstants';

/**
 * video slider component
 */
@Component
export struct VideoSlider {
  @Consume isOpacity: boolean;
  private controller: VideoController;
  @Consume  sliderStartTime: string;
  @Consume  currentTime: number;
  @Consume durationTime: number ;
  @Consume durationStringTime: string ;
  @Consume isPlay: boolean;

  build() {
    Row({ space: MARGIN_FONT_SIZE.FIRST_MARGIN }) {
      Text(this.sliderStartTime)
        .fontSize(MARGIN_FONT_SIZE.SECOND_MARGIN)
        .margin({ left: MARGIN_FONT_SIZE.FIRST_MARGIN })
        .fontColor(Color.White)
      Slider({
        value: this.currentTime,
        min: 0,
        max: this.durationTime,
        step: 1,
        style: SliderStyle.OutSet
      })
        .blockColor($r("app.color.white"))
        .width(STRING_PERCENT.SLIDER_WITH)
        .trackColor(Color.Gray)
        .selectedColor($r("app.color.white"))
        .showSteps(true)
        .showTips(true)
        .trackThickness(this.isOpacity ? SMALL_TRACK_THICK_NESS : BIG_TRACK_THICK_NESS)
        .onChange((value: number, mode: SliderChangeMode) => {
          sliderOnchange.call(this, value, mode);
        })
      Text(this.durationStringTime)
        .fontSize(MARGIN_FONT_SIZE.SECOND_MARGIN)
        .margin({ right: MARGIN_FONT_SIZE.FIRST_MARGIN })
        .fontColor(Color.White)
    }
    .opacity(this.isOpacity ? DEFAULT_OPACITY : 1)
    .width(ALL_PERCENT)
  }
}