- wire:配線

- 1'b0
- 1:1bit幅
- b:binary

- 4bitBinaryCounter
    - EN:enable信号。1ならトグル動作を行うが、0ならしない.

- always以下は監視。

- CA = EN & Qについて。なぜ？
    - EN:前段からのcarry
    - Q:現在の段の出力。
    - したがって、ENとQの両方が1であればオーバーフローして、現在の段のCAが1になる！
    - どちらかが0ならCAは0.これは、ENとQの1bit加算につじつまが合う。