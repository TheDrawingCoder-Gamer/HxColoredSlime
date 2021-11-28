package net.bulbyvr.coloredslime;

import net.fabricmc.fabric.api.blockrenderlayer.v1.BlockRenderLayerMap;
import net.fabricmc.api.ClientModInitializer;
import net.minecraft.client.render.RenderLayer;
using Lambda;
class ColoredSlimeClient implements ClientModInitializer {
    public function new() { }
    public function onInitializeClient() {
        BlockRenderLayerMap.INSTANCE.putBlocks(
            RenderLayer.getTranslucent(),
            java.Lib.nativeArray(ColoredSlimeMod.SLIMES.array(), true)
        );
        BlockRenderLayerMap.INSTANCE.putBlocks(
            RenderLayer.getTranslucent(),
            java.Lib.nativeArray(ColoredSlimeMod.HONEYS.array(), true)
        );
    }
}