package net.bulbyvr.coloredslime;

import net.fabricmc.fabric.api.blockrenderlayer.v1.BlockRenderLayerMap;
import net.fabricmc.api.ClientModInitializer;
import net.minecraft.client.render.RenderLayer;
using Lambda;
class ColoredSlimeClient implements ClientModInitializer {
    public function new() { }
    public function onInitializeClient() {
        for (color in ColoredSlimeMod.colors()) {
			BlockRenderLayerMap.INSTANCE.putBlock(ColoredSlimeMod.SLIMES[color.name()], RenderLayer.getTranslucent());
			BlockRenderLayerMap.INSTANCE.putBlock(ColoredSlimeMod.HONEYS[color.name()], RenderLayer.getTranslucent());
        }
    }
}