/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import ZonesItem from '../entity/ZonesItem';
import { ChallengeConstants as Const } from '../constants/ChallengeConstants';
import { ImageViewDialog } from './ImageViewDialog';

@Component
export default struct DesignStyleSwiper {
  @State currentIndex: number = Const.HALF_COUNT;
  @Consume('introductionData') introductionData: ZonesItem;
  dialogController: CustomDialogController = new CustomDialogController({
    builder: ImageViewDialog({ currentImageId: this.currentIndex }),
    customStyle: true,
    alignment: DialogAlignment.Bottom
  });

  /**
   * Get the image offset coefficients.
   *
   * @param index
   * @returns offset coefficients
   */
  getImgCoefficients(index: number): number {
    let coefficient = this.currentIndex - index;
    let tempCoefficient = Math.abs(coefficient);
    if (tempCoefficient <= Const.HALF_COUNT) {
      return coefficient;
    }
    let dataLength = this.introductionData.imageList.length;
    let tempOffset = dataLength - tempCoefficient;
    if (tempOffset <= Const.HALF_COUNT) {
      if (coefficient > 0) {
        return -tempOffset;
      }
      return tempOffset;
    }
    return 0;
  }

  /**
   * Get the image offset.
   *
   * @param index
   * @returns offset
   */
  getOffSetX(index: number): number {
    let offsetIndex = this.getImgCoefficients(index);
    let tempOffset = Math.abs(offsetIndex);
    let offsetX = 0;
    if (tempOffset === 1) {
      offsetX = -Const.IMAGE_X_OFFSET_MAX * offsetIndex;
    } else if (tempOffset === Const.HALF_COUNT) {
      offsetX = -Const.IMAGE_x_OFFSET_MIN * offsetIndex;
    }
    return offsetX;
  }

  startAnimation(isLeft: boolean): void {
    animateTo({
      duration: Const.IMAGE_ANIMATION_DURATION,
    }, () => {
      let dataLength = this.introductionData.imageList.length;
      let tempIndex = isLeft ? this.currentIndex + 1 : this.currentIndex - 1 + dataLength;
      this.currentIndex = tempIndex % dataLength;
    });
  }

  build() {
    Stack() {
      ForEach(this.introductionData.imageList, (item: ResourceStr, index?: number) => {
        if (index !== undefined) {
          Row() {
            Image(item)
              .objectFit(ImageFit.ScaleDown)
              .shadow({
                radius: Const.SHADOW_RADIUS,
                color: Const.SHADOW_COLOR,
                offsetY: Const.SHADOW_RADIUS / Const.DOUBLE_NUM
              })
              .borderRadius($r('app.float.small_image_border_radius'))
          }
          .offset({ x: this.getOffSetX(index), y: 0 })
          .zIndex(index !== this.currentIndex && this.getImgCoefficients(index) === 0 ?
            0 : Const.HALF_COUNT - Math.abs(this.getImgCoefficients(index)))
          .height(index !== this.currentIndex && this.getImgCoefficients(index) === 0 ?
          Const.IMAGE_HEIGHT_MIN : `${Const.FULL_PERCENT_NUMBER -
              Const.IMAGE_WIDTH_OFFSET * Math.abs(this.getImgCoefficients(index))}%`)
          .aspectRatio(Const.IMAGE_ASPECT_RATIO)
          .onClick(() => {
            this.dialogController.open();
          })
        }
      }, (item: ResourceStr) => JSON.stringify(item))
    }
    .width(Const.FULL_PERCENT)
    .height($r('app.float.swiper_height'))
    .alignContent(Alignment.Center)
    .gesture(
      PanGesture({ direction: PanDirection.Horizontal })
        .onActionStart((event?: GestureEvent) => {
          if (event) {
            this.startAnimation(event.offsetX < 0)
          }
        })
    )
  }
}