使用这份手指修补的时候要用以下这套姿势：
在+PR里加入：
[(better hands: 5):: 0.3]
在-PR里加入：
bad fingers, (fused fingers), (one hand with more than 5 fingers: 1.8), fingers without hand, poorly drawn fingers, (sharp fingertips: 1.3), (sharp fingers: 1.3), (short fingers: 1.3), (missing fingers: 1.5), unclear fingers, (uneven finger thickness: 1.4), (uneven fingers distributions: 1.4), (thick fingers: 1.4), (confused fingers: 1.2), (compressed fingers: 1.2), (severed fingers: 1.2), (reverse curved fingers: 1.3), long fingers, (long thumbs: 1.3), (thick hands: 1.3)
如果你只是想无脑使用不想精细了解那就到这里就停止吧。

那么接下来是解析时间：
众所周知NAI生成图片是从一张模糊的图片“混沌生成”的 而(在不使用高清修复时)生成图片的阶段大致为：
模糊图片--5%--轮廓确认--10%--细节轮廓确认--30%--初步填充主要细节--60%--填充所有细节--100%
由于AI并不知道“手”这种器官到底是什么 长在哪里 有多大 有多长 什么功能 能不能向背后弯曲
所以教AI认识手是没有特别大意义的 d.h.基于少量样本教AI(起码是NAI)推测更多手势这事儿不太能行
那么最有性价比的方案就是让AI确认清晰的手指轮廓 这样起码生成的手指不会是融合起来的
d.h.我的模型不会做>手势<修复 而只会对>手指<进行矫正(ebd修复手势的性价比太低)
那么核心逻辑就是在细节轮廓确认前以短时间高权重对手指轮廓进行一次修正(权重高到完全过拟合的程度)
但是由于更后期的细节填充环节不会再次大规模移动已经确认好的轮廓 只会对细节进行填充 所以已经正确的手指会被保留而过拟合产生的色彩偏移则会被消除
直接端上结论，[(better hands: x):: y]包含x和y，x必须以最低2的权重执行 这样才可以给出足够强的影响力 而y不应该低于0.25但是也不应该高于0.8 过早的卸载时间可能导致轮廓再次移动 而由于模型本身为了保证在短时间内的修复力度而强度很高 过晚的卸载可能导致轮廓过于强调从而破坏解剖学结构 甚至有可能因为过拟合而污染画风
至于数字如何设定 这要看你们个人的调教了
祝各位好运。

[BETA_0.12.129]R137dLR5e-4IS4750/LR3e-4IS8100/LR2e-4IS11500/LR1e-4IS13750