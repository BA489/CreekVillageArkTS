/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Point from './Point';

@Observed
export default class IconItem {
  index: number = 0;
  clicked: boolean = false;
  image: Resource = $r('app.media.badge1');
  point: Point = new Point(0, 0);

  constructor(index: number, image: Resource, clicked: boolean, point: Point) {
    this.index = index;
    this.image = image;
    this.clicked = clicked;
    this.point = point;
  }
}