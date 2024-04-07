GDPC                �                                                                      /   T   res://.godot/exported/133200997/export-22792ee0018d439a895e1f6e6e7db267-tile_map.scn@�      0      �L.z�~f���`^<�    P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn��      �	      �E�F�C`�кi���:}    T   res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn  ��      (      ~c�������JW��5    T   res://.godot/exported/133200997/export-476015aef76b99fde0b3e1ea5f5c7045-popups.scn  �      �      L\����T�+sr4��H    T   res://.godot/exported/133200997/export-47aea4e83326632d051e4d55761a6aec-tileset.scn ��      X      ��[L[0��^�    P   res://.godot/exported/133200997/export-5b94865898bd9b5cb44e426bf42f6f48-mob.scn ��      �      �m�qF��ʠf����    P   res://.godot/exported/133200997/export-5c1b5421b3a3843354800198f9326b19-node.scn��            ������	#�% �    X   res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res       �	      `��~)���j��P��    X   res://.godot/exported/133200997/export-d8c1c4ed2031c9625fe55ecac78cd547-iso_roads.res   `<      �      �=��e��
{��|��    P   res://.godot/exported/133200997/export-f4cf891e5f7a93b93d9b27cfb8401ccb-hud.scn �#            ���_{�-D��O�    ,   res://.godot/global_script_class_cache.cfg  m     �       jH�p�� �I,4F    L   res://.godot/imported/Character.png-bbf5947120bf90fb25be265ba323242e.ctex   �      2
      �3n��>`I��=;�    H   res://.godot/imported/Crab_Run.png-30fe5ec3f113e878b9bc37dce2076ed8.ctex�      �      �Q��X��j��I�Q��    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�.      �      �̛�*$q�*�́     \   res://.godot/imported/karmatic-arcade.regular.ttf-cf1dd96e5a7bfeb428b035e8970c4f97.fontdata  >      �9      �1�ޓ9VYR��n��    L   res://.godot/imported/manaspc.ttf-047416f90850ca6415b559d0971e59cb.fontdata  �      �      EI�õ��z�����|�    X   res://.godot/imported/voxelExpansion_tilesheet.png-5c660119a35f8f9520f397723a19f0af.ctex@     �R     5�9i&��N����       res://.godot/uid_cache.bin  `q     �      ��}󇍆*y �N� ;x       res://Camera2D.gd   �      �      K�S�p�$�
�U       res://Character.png.import  �      �       }25r%s���O��X       res://Crab_Run.png.import   @      �       �	��L�G��Er���       res://Globals.gd       �       R��e�Ӱ{���MԼ       res://HUD.gd�      �      K�p�t1G�k��L       res://Main.gd   �x      	      �k~��R�y����-�       res://MobSpawner.gd P�      2      ��@�/k(c,�I       res://Timer.gd  P     �       �9�J�M�����S{ک       res://anxiety_mob.gd        �      �N���oN��;�3~��       res://default_env.tres.remap�h     h       cXv�S��P�O�Tq�o       res://game_singleton.gd �      @       ���AB�7��~�}I��	       res://hud.tscn.remap@i     `       L�
�H��l�YB��       res://icon.svg  �m     �      b�pW>���d���       res://icon.svg.import   �;      �       Lc���`��5�c�       res://iso_roads.tres.remap  �i     f       @��S���}��#�S�    (   res://karmatic-arcade.regular.ttf.import�w      �       �Nf3�o&�����DO[       res://main.tscn.remap   j     a       �J�Sw� ������       res://manaspc.ttf.import�      �       �͕ yp�:=�em��       res://maze_gen.gd   ��            =w�9}i*�&�L�ɑ�       res://mob.tscn.remap�j     `       dV1$�F�/]o��y       res://node.tscn.remap   �j     a       �!>��!#28�橸       res://player.gd ��      <      ��G�!�2մe=�>W8�       res://player.tscn.remap Pk     c       ������T�?�L���       res://popups.gd  �      �      qM����%�������       res://popups.tscn.remap �k     c       ��@3���&Y�=��       res://project.binary s     	      �vd� k�H�ʫ��.X       res://tile_map.tscn.remap   �l     e       ����/tw*��i���ߖ       res://tileset.tscn.remap0l     d       /{7����o��d�g�    ,   res://voxelExpansion_tilesheet.png.import   �g     �       ���r��4�G� ��L                # Citation: https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html
# Mob Images by Admurin: https://admurin.itch.io/enemy-galore-1
extends RigidBody2D


var min_speed = 50
var max_speed = 250
var mob_speed = null
# Set randomness in the anxiety mob's speed for unexpected actions
func _set_random_speed():
	mob_speed = randf_range(min_speed, max_speed)
	return mob_speed


func _physics_process(delta):
	# Get the player's position from the globally acessible singleton
	var player_pos = GameSingleton.player_position
	if player_pos != Vector2():
		# Calculate the direction vector from the mob to the player
		var direction = (player_pos - global_position).normalized()
		linear_velocity = direction * _set_random_speed()
extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	adjust_camera()

func adjust_camera():
	var maze = get_node("..") as MazeGen
	var tile_size = 32
	#current window size is 1800 x 1500
	var maze_size = Vector2(maze.x_dim-2, maze.y_dim+2) * tile_size
	self.zoom =  Vector2(self.get_viewport().size) / maze_size
	var center_cell = Vector2(maze.x_dim, maze.y_dim-3) / 2
	center_cell.y -= 1
	self.global_position = maze.to_global(maze.map_to_local(center_cell))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	adjust_camera()
          GST2   2   H      ����               2 H        �	  RIFF�	  WEBPVP8L�	  /1���(�dY�~��?�-x����5;Hp�F�$9�ļ��bX�Z
��+�ն�Ss�)*
5�@ �cCr$I�������t���Vs]f��������k� ���}9S����޷�=��`��yD� B`�
����0 @�PP  ���PPh������`�K�M#�\�W� Ԩ@G�)��ʤ�aH�ĐJT#��	^͚��*�۸��8p�4IHړv�_���o�M�-Ii��X:��)��N�w|�_`u6���M���s�v����E�&7k8�߷�_�BA������D|`_��zwSc?`�;A8����"In�w<�o�|;-�N���g�G�X�=��u���w��1�`.���1�@��'+�0'�q�����wS���	 Rp�;oN������NJ�e����`sss��_|(�6��^	*,r��W�ƚ�} 677_��4��oJ�̤�l=�d���<�h�~T������>n�
+"g �;���
��y �Lf���i��Bf濟 73��ld~@fci��آ��:*Gfj�5�$�,�@m2k����[�f)JVJ�W���(E� _���X���-�|0J��Fj�2���F�<��T�QT#Eq�u����(��	 �Ԑ ���H�źS2J�&Pg�_���7��p  	3�F�#z��O��s�0����p��/��|��q��;�<�������<_#ڧO�~�.���]xpg��O��õ!9���y��?������D�z��N���?NO��W=  f�����z�����!�~��ǀ:����E�C �9�rd�������~:���t�% �e7Q��~�E��l#�]�� L=hQ���]�ڣ��̈�N55�/�{�¢�g@�%�&JE��l�F�������������@�������HZ;;h�����u����#�����Y������}t������������{w���W[i{�R�i��HK|H�0�F�u )5�6+�����٨����|+��}��,Dkx�R,���(�:����Zi�Y��a&�h�� �4:l�}��}Z6*")��)ci�*M|�C��j/���O5��8p,TO[3��Df�RJ�^^�,�3%��]T����� ��jx�aF��)M&�Y�e+g@J�A-�����/�����nϹ˲, H	 ��\u��7������z�)%`F�s���X�ՌyNt���<��� �@�c��[�{��_� н���-$����
�������z�o��s-粙�n`��j?WG?�3�О2;�C�l�A sߺpp�]V��걬��<r��� �V���. @�e�Rý.��*��G��z哟�ȈK�CO��Ϸ}�ѿTa%�����5I�?q��;��'I�J���SIVD�.���x��?����Z����(� RJ��� &���Ff��. )}����� <��÷���aa&?�L&h����w�����U�2�m�c<�~!���P����_SE�0K]U�ъ`��{[�pШ���A<�������ծ�@����0�v��
���¯�c!Eia���d)+�O����7E� _�vDF+
�
[�ds�87�+�����92�#Tܠs�IG�E)0��$/��j��x��|`Iw�SG"p�+ϫ�e�6�pH��s?譬�5����k}/�Q����I�e7��+����t�9@ %��':�d�0p܇΃+����!# $��� p' f��!� Μ��z��<σ����vf!��#��������������\��C�U^�ޮ��;��t�<�L�'�J?�1��	�g�k�,���xG��5z.��s�q�濗Y��g7y��z5�L��3?�)?� \YPG�0S /{�Kffz����FW��zuk��jd%��yk�ѽ�͢�����i�%��(��ڣ5R��KI��?D�Pw� � ���W2,���� ��o�����e��������7,���z����d����
o#)}�����o��DjU��ь#S������w�L��f��� |^V��?���A��͊�[cJ3���佬45�Mx	~a�ffo����4���fRJ��5�s,�2r������0)�t��_�X�9ZQ*���G�C(�
 v����Ҋ#�x�2�W�H����'3���)E1d�:)��x|/���=Z�˲�i��y=��"`<�1�gY6�?�u�8X%��[ �e+Γ�.Ót��� �౜=G����'�WQ�93���}f�%>��*��g��x ��:��U�ؐ�����>VUՏ��z���d2���蓵������]Ft�ǆ�;�˓�UU��U�ܹs�67�
u��z˼�If. hU�,�OΝ����ܬ~�֐���n u�x|e�-��~�f��v�υ������3?E+������������f#I�]Ȣ0;"��FE!)t�������G�5�	               [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://n8ohc7onas8v"
path="res://.godot/imported/Character.png-bbf5947120bf90fb25be265ba323242e.ctex"
metadata={
"vram_texture": false
}
            GST2      �      ����                �        n  RIFFf  WEBPVP8LY  /��_��msL�BH���\>��
��msL��������́�-8$@�.����(33��;����5��zZ�ɟ� 	�� (�b,u����v�J�/����E���F�$�^N���'�������B�ɗ�L�YR����I���ݽ�]�w��WbvD�����*{,�WK�j_�R�j��`.�,�]^P��f��T� C:���+M%�p�R��gn�l�C��눙!�����R+rvt�s|pTDz<a~��t�wwE�{�Ä�`ӡ;����R�Y�{��<$t���6��ϓ��Z�����?����BEbB��_�{�w}�ED��j�d���0�s���ƴ"����6J{���A���r7b`��;�j`�m�j��'�="��8w�X7�ve�^G���Uw�Vg*��A��%0�ڔ�	[���0��a�Y_��a�p7�`X0�DT�h+k�l{- s���+�6���y���Hk��Dml��^��a��	]m���Ơ��ZQ�%5�G��uU�=nQR�*tʶ1�1#�oi�T�aJ�G�
]���j��\R�V��K{�(L�8\��I�돣"ե"w���t�PO,T_���w�J�����ܗa�^�fI�^�H�a㬜���,t?��"ӧ�>K�#�"�L��;w���x���E�D�����/UDz<a]��GoW�'�d�֬�=�+ӷ��j�����:���'CW�j ��r�{� ��]�2�8w�Xe*U͈�6�j[k���VIj�Aԕ+0̪;|�cw�����0�6�&te���mʶ�i�`�1��:GD��2��5D�^�RF�-��Q{U%��D��R�v��H�Ju\��ڠ���           [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://oemv3pa7jsql"
path="res://.godot/imported/Crab_Run.png-30fe5ec3f113e878b9bc37dce2076ed8.ctex"
metadata={
"vram_texture": false
}
             RSRC                    Environment            ��������                                            d      resource_local_to_scene    resource_name    sky_material    process_mode    radiance_size    script    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction        
   local://1 Q	         local://Environment_tuqub e	         Sky             Environment                                RSRC               extends Node

var player = null
var player_position = Vector2()
extends Node

var grid_size_x = 35
var grid_size_y = 35

var step_delay = 0
var allow_loops = false
var letters_to_show = []
var show_labels = false

signal fringe_changed

var was_hit = false
               extends CanvasLayer

signal start_game

func show_message(text1, text2):
	$Message1.text = text1
	$Message2.text = text2
	$Message1.show()
	$Message2.show()

func show_game_begin():
	$TitleLabel.show()
	show_message("Welcome", "Press Start to Begin...")
	$StartButton.show()

func show_level_won(level):
	show_message("Level Completed!", "Press Start to Begin Level " + str(level))
	$StartButton.show()

func show_level_over(life, level):
	show_message("Lives Remaining: " + str(life) + "/3", "Press Start to Begin Level " + str(level))
	$StartButton.show()

func show_game_over():
	show_message("Game Over!", "Press Start to Try Again...")
	$StartButton.show()

func show_game_won():
	show_message("You Won!", "Press Start to Begin New Game…")
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed():
	$StartButton.hide()
	$TitleLabel.hide()
	$Message1.hide()
	$Message2.hide()
	start_game.emit()
    RSRC                    PackedScene            ��������                                                  ..    ScoreLabel 	   Message1    resource_local_to_scene    resource_name    device    action    pressed 	   strength    script    events 	   _bundled       Script    res://HUD.gd ��������	   FontFile    res://manaspc.ttf �it��ep	   FontFile "   res://karmatic-arcade.regular.ttf �O�N���H      local://InputEventAction_p850d          local://Shortcut_u6p5x Q         local://PackedScene_far76 �         InputEventAction       ,      button_pressed 	      	   Shortcut    
                   	         PackedScene          	         names "   #      HUD    script    CanvasLayer    StartButton    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    grow_horizontal    grow_vertical    theme_override_fonts/font $   theme_override_font_sizes/font_size 	   shortcut    text    Button    ScoreLabel    offset_bottom    horizontal_alignment    vertical_alignment    Label    TitleLabel    size_flags_horizontal    size_flags_vertical    focus_neighbor_top    focus_neighbor_bottom    autowrap_mode 	   Message1 	   Message2    metadata/_edit_use_anchors_    _on_start_button_pressed    pressed    	   variants    (                         ?     �?     ��     ��     �B                         8                  Start           ��    �D     �B      0          ����   ���>     �   �S�    �D   �(B                                            H         Mental Mazes            ��     �A   	   Welcome!    ��?   +���   j� B      Press Start to Begin             node_count             nodes     �   ��������       ����                            ����                                 	      
                           	      
                                 ����                     	                           	      
                                       ����                                 	      
                                                                                                            ����                                 	      
                !                        	      
      "                                       ����                  #            #   	      
   $            %                  	      
      &                         '             conn_count             conns               "   !                    node_paths              editable_instances              version       	      RSRC             GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cmpsbip5xatxr"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                RSRC                    TileSet            ��������                                                  resource_local_to_scene    resource_name    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level    script           local://TileSet_1y1kf |         TileSet    
      RSRC        RSCC      ��  `  >  a  v  �    v  <  `  �  �    �  K  �  (�/�` �2 
E�C�5k\dD�V@��{���`yz�����zj�֒m�#��p���Қ�!��fpdI�$�X�MDDH
� � � V4c�%kxA����Ջ���i9��TV���U���$lo��UVl�7&�vl�6,kzGm�/Hڲ��pLIY�P�c:^�I;�$YЯ0�h�r��F�-��޿'-MW9�:�uL����5v�1Ц��u��i/,�I$Y[?�6V��҆4S���I�6De������m��(-ͣ�����}Efi�5��{Y����S�CH9#V�zA�(^�q2i)���Ob���y�ˋ�Wz>�\�����!b
�E�����s⇰�"@��k�9��j��&|m	�Wa[�$j�R&dŴ��X.�N%�ecf��I>�t�cX�t5[��h�siE�L�ٙ��am�ڴ����f��5XC,�
k�?�ZqDA���j[�=��Ҟ���ړ�C����l�����m���#Q���f�?ѽ����s���B|@����4u�cڐ�w���ϼ�q��I�M��AU�������m��Љי��ɶ���u���E�o�7��{�&�&D���ض�4L��j�(�|P��ۢJ�<O%��|�r<�� ܐ>��>L��� ������@}�#$3�����P��k�}������x��P��
 8d� ��� X�>��^۴?�h�@l�VR*0[�I���ٜ�_�Lp��{�U�;��:!�ü%�g���lo�9}��z�#99�*�����Z�l�佋�>E�y�oӽ�t���������F�tu�w�%}o���'޿���|O���Q�?�^xf��Ay�5�؞�2R�=5}��H���-#2$""�$I��9�%���P�4##%"R��2�R��- DR]�U@%����V�/�����b���|��6���bo�o0p�oY�Ѱ���~c��o�g�����ʋ�e��H>�w����3nm'X��'�,_���vv�{������E������~ۯ�"�	o[73���onW��܂C���܏�
�F����li��L?^��l��'����m�g4���a<k����՜C-]ˇ_c>��%�C�i�;���2P>�,{�����@N�����>¡磢	3o�Ӿ�"��<��ĵ��q`��wɍ�;S��������1���DָM�]2(7�2�;1�1���s��a�\Ɲ�w3���[Qg����vV���f���D>d����]M��#�Aƻ<^6��̰���{z�%���[�`�����Y���I2Ey=��j0����o��wflE�X/�כ�M�n��^8��w��1�vӸy�@=v(�6��>`�.����w�=z{��ٜ��G�ӫ�S״�T�-�'�?�����߉�I��<u�=֦����|b�84,w�zCL⇜?A���o���R���W�]4h7�@�=�D��`���젼��5}P�������k���Z/�=����K��Iy��)7[�QI}��8��oKq��}ֿ�xGR3�PH�F��$r�c}���9��F�
剟�B���`(�/�` �1 �\�5�;�0� �FG�B�BV�S��*<wd�@� �H^��r�N{z[+2�4���)fE4]E3���4�D��騔I�J�f��j~0S�S�ӌ`>0+��L%Z$�͊N�s*�}F%�)29P� ��cr�Kޒ��,C�'�����*��R�v#�@`@��Z�̷�w���,��ݶ�6�6�\[kS��i��J����q|M�ޣ'�;v�Й#'��qӆ�5�j&f*��3f�X�#�2%��/^�p٢%�+����*T�H��	���&�L�(I�䈑�"D�0.*&
	�x�a���<v����_��|{z4f�Ɉ�wgㅋ:�9�g��BE
'L�p#1�M�Z5<t�AC������,��U�0!LؗWזVV�+XM�*����,�
�,��깖�t�V��j$u��J�O�dj�:M���Sckm��T��5�5�
��W��ֵ�
v�p=��]eM-�1�-����u�J���XHl#�1%['��74�4��SZ+-SvP�Gj�������YF�"Y���$�c��܆�Vn�lmmm7�������M��uG�R����9������v��3�ܛvS�
S@4��&�~���9:+���&�h�'�.Y����EPA�b����?����� �y�/�;i3n��b��[�N�g�komyC7��x���r>7�ͻi�Tn7E��MǦ��<�zM��Е4Z�vB�iCz����1�+Y�����ċ�����:�Cx��g���{y�W�h>�/�����[~��c��z�皷����o�m�cW���|�%]˳\���<�!�ѻ7�������-`؝�<����;��~w�:���x'����8��]��n�|���}�i<q����a��?^���s.�t�xDwq,��7��z������������]�ro�+�|���|�/:�G��^��7� W��y���L��*g����z�	?�'����܏�ܕsSn/�r�����߷|'p �o���q�w���mf x�k�3�;%���T�)�[�{�gJ������j���I�d�R�Tk�Z�Z��ۚǭ�q�{\��
�axs�I�����h�'/����=���}�y�����)^�mq��]�a��֯nu驾�Qw��(S
�q��X>�f�f`���w�)J7E��?������_'�%�����l���&a�R���d7�4$ɰCׅ����1�+�"s� ���0��:	D�|��µ��j�Ј5_Y>xs e5I���4wF�8*G�V�S\�Ȩ,(:	l8�5`�40���ңz��Q�{���`)�J�+�h�����ʏ���"��@1$)�#H1���H$�P����2�&A�DɶM�>�5H+ �h��d��jGN�� ۠��K�uH'I7���A[6��ɂ�Ls���]:n}W�7_�:i��Y)��2��.Gv+'Cm�ӂ�༢#��u�� K�8���z?�%̧W� �l?��V�u[BMZ�6�l$OnO������aa�#cz[a�=�j29R�~���R�n{�(�'Qs�|V(�/�` � �HA)�{��W�T��q�V*Tv]�+ւ��S���f`_��(z� F��*���B�et3ک��x�����5 2 : �F6�~�ߣ�9إ_��V�QX���1�ӊ�J�D�1��n=�j��S3���	�x�0����y�9�i�\3�3���.����*����IYd�;޸�w!]7'$y�#��s5r3�2�;��� �H'4�r�vw���{RV�ɋ0B�ӊ� z�6��P6�`	^h�K_�J%>�]��v'�Rz0��"����C��W�6O��Vp�����"MR��1��8��1{�qȵ 
+���$� 

RP�J:�ē�,B��yT'�Gy��=ێTHL+g:|	�,�3pp���ڂ�#�H��;z^��%�|_��wB��l@YR�͠�����iV�I�z����cԙ����D�/�S+j.��g�Z��A�r��#�H϶�1�����pn��I�L�*5M��RUߖ�b>��	���\pN��c;wf�3d�����|t^�u�n)���ҁ�~ٍ��&��cܝ�;��+ա�a�f�"A�4���j���I�!V�&��q�j�f鎭�oY�v�(�����TΘ���9���'�ࠄ5�αyq~>cb0�{�2�7�>���ԧ�մNipB���$y��-�kE�ΐ*�/�In��=�EML
�I��2��0�����{�_���6�hv`�߲��9�FQ�h�m3��5�/��'��:�3L���
�>&؋	K��^���0	�L`ކW^�m|�t${냗_{�j��Z��f��A�+��X����B)k�X�(��j��|	����{#�g��τ(�/�` e VYD �&�m]��Q�mu�{U16��=�;�Kݟb�����S��
B ��Ҷ����!(q�U�d�i�4�A H N �|��%�<�ȤG�䏵A{�1�k�q�����E�>�afƙ�L���i��c�)�*t�Y�̔']B����S���/�'$2��@��}B"�S�b���#q�?��sxéo���-\a
O5�2���-o�fye�S�òi�;��D�i0�t��	W%���rp)�0]%�=m��h���`xq���E.�VofB���♮V���i�r��]f&N��U��4�0}iK���ҕ�4�(=�IKJґ���QC*H?�T�v���hF������,^�`!����MR��8��@��A}�qJ��BC �)I��JRF�9�a�:"fL�x��a�V,[��NNtK�%�1�~"��'v���:8B�b4U��B�S0@$��\fE�;�RQ���,'��e"���+���:�Tb������m�v��f�c�̖J����(��'@(�u���4TĚ4+��	� Z�A�d��%�&�����s�Pᖜ7��-Wu��Z �x�}q�� �'z��8dsjI�jx��U��v�H��!6xPG��ȋX�x�E� ��X��[��GZ���;R:3�OAR���|Q���}a������Q��D���-���'�GX��Nܙ��MO[���W��Ї��Ǫ��c;���u����BQ!P͝Z�f�����;�Kx����ty2�B|�w�(��L�����va��
�nQ� 6�wl@��
Hb����o�%h�!6�Fʇ)�Zm������w�ztX����WQ�9HoJUwuGO���ƛo(�/�` � ��?;E'�n�	�����ACCEHhpQ��$�Q�߷vq�5J��!o/��kߢ��$�6�), , 3 �fX~:a�.x`���Ui։ԟ��H����ݝs�d�}U������u���5�<��1����-��2�'�\��߯C�c�;�8�+�����$��n�J$F�U�ά�F	<Tj!J�rH�<�imt�D-t�@��s�<��bT� 6�U)�T=�Z��	؍Mcc�4�`#pm+a��Q��v�
t�["�����#I���p��	�= q �(�0&1H$"�H$""2�I�h4t}vT�̂�N��!�U��p>A�*��ܿ�<��󔀵�_R�`��ùQeIz��cz�qo�y��z�g�p��m�M @m��j۵�j�QVwE�aV��XZ�M]��"[�-�����ي��¼N�m�J�Blە�7n�&�uۭ^��E�h���ś�T��4�l����m��lNch������KN��˕/�� �q|���]@���K������g��.� !����} ��������XK��)�c��˥_9W/�ד��$�`�?˛�8�U�H��e���:Y�O�q���&�;��_����,�g�^C�G�,��G����S��x�XIY�:�c=�O�Jn�d�T(�/�` 5 FGB 	)�<� cd���v����웝9w�CI��;�X5��j!l�m�J'����՟���g�u��x;$�)7 0 3 ^�wwι�v����}��\��������)�A��P�S$�R��`/X�	F��0w�n��UN�I9d�Us�1j�-���X�!v�an]%�q/�{��XL�w�ʋ�N���POCa�	K8��m�x�p�@��3�;���5�<��;�F�Ŝ��d�/5FU����mV�sBg��T�A�HӒM)WFU��'� <�vK�&��Ve�p�Q�A H�LDAC�"#�D2AI�$�|�����
"�ɖ��2Y� 1�^<(�U9]-�α�љ_%G������m�O��Ԟ&6��'^�Tv�V��_s޴��I�0L�'a�c���
��/�.���:��9�j����sV��/�vC�|&���x�Vq[���5;
��NzPUMu�#� �7X�{ �~*{�������J~.�	����×&o*\���y�ֺV�Y\*ƫ����v�̷%8�a,� ���<Ο�C3�S�$����j���_��4٨&N���?�D�%%Ϡ_5z�y6ZZ�1�ק��[
�jmz/�R��i��>bثa��ڙ5�?��	��4�}���*��!�����Lc|����	�˛���5 8��DR�/��8�����'�t�!~����H������*'#t�]��>��q=��)��\!���խ��Z��mǜo�R(�/�` e ��;80s�0M'-�4OY
Y���(d�4O����D�H����fi��"A�4 Cv��) ) - �
'ܽ���<���rp��B�C��)����J���9�J�����3j�_v�e�WV�M.��E/���s�q�W<���;�p3�����JÚbeR�H�y�i޷�m��ϭ}��u��W�\3M����d�%S"J�I�kwjC���~��)ʈ,^��T@���I��5'	k������$[�p�!��1��	T�sd�!�A"��#3��<���Q"Rd%��������P(�FF9���#���`��Z/�twت�9���:M^�ee�)n��:P���]E�T2�OS��H^�����~����	{]�����&������ �6��a�m����S���R̚a	F�aGNm��T<�T��0z��ٞ���@����Y|i'�A���	k��Dn��_�El���@�H�"o�xY���|�Ew�>3�&���?��� =�#ёjy�����e:�r'U�-脁�FxA�#��f�
� E��Jί����t���!�̽�1}̺SV�������������ɴC��<�t)�(�/�` � FSFA)�tN�����*�J�˸l��Z��UR3����U0� F���
<Q���`U�ETb�y;6�)3 0 6 ���a�Nao�jd�X�_M��b,R�nƨ��� )nY�n�uw)�4m]a���A��ϲ{�Y�q��f�g�9f�_n�۵�)�|��$���s�c�QS,��dMlu�tw��~+uF�b�
%T�T�2��,�R�����
N0�|�����k��rJ)5�����)���X���N_�ʽr.�/�Ir5�s�S�4��M�t�8��	��IR���1�A{�a��sBC�df&)��(�tlXN�ʐ�/]�E��	�V9����f�u�{�s�Mʽ:�0�,�ھМ��b�^K\��\4PE"(�;<�� TO�-ӡ�|���P5�E�C.��*V��n��R+���iz+td�u�����ÒSLw�.��}~����l+���K.-�����>T� �t��>W��:�}�s�{H��Q�A�#�絛S.nԵ����F::��V��~�E��y�d���cp�ɦc;����O��sa�T�~��	�Ǟ�\��(y���}���9����xE��*������/y�K���{,���AY(A�� Fs��'���m�e�!�Ž���9M"�jAݽ��)�Id�΋St�ڰE `y�H痔iv�� �l�*������>}N�Ÿ��q���-m-���QG�[��wkmasy�
�3)��ÌZG��R�i�-��W�4끳sta9�g�D�Rn6���<�]ǋ.3S�g����g�
(E 
}���S��(�/�` � ��LD �(�d��H\z	��ʶ}�A� 	a
g�LG�
N$89�@����T{,^����:���N���7�$J�S7 : < ��L�ȝA��{��7�c���g�p�Yw���`RZ���e-���9�Œ+v��C<�.C����uO���0�/\a
Ox��#�;8u��`'�ߥL�8� fye�S�lW��npq�iTO�oql��'~]�����0ʓ 9@/]QlSq�P~�Y
�N�9��\����69�T�d3i��w��r���v�(#eR��+��eҢ�9��ֿ!eTDŁ��&�&����I�c��R
� �3�9����QFIQ��,�ll�Se˴I��k��vǴ���FQ>��O+e {���-[�=�B�j1�%
����<\� -+	l���"�P�P�+de�9s�{��%�m<�\�,�,�3�rєW�z������hWRW8fu�Cj1c<�� �@�"�8%��������ta0"���[�80]:ˎ�4�i$���{��R��v�H̸ؐ�}C���	��bT��r��;S��G�d�&[�M�b0�h��u�-�g� �@��p���X�Hᖆ��(u"�Vۚk�o��<�@���d���2�[|��Ύ6�/(�ȹb���Dn�N��?G�oS�ۂ���$천���*�����cpfnr�2�xE�4ʨ��������y�7@��q، �T�:�X���+�-��W��<��D�xHo@�X�͌��pQ�(X�yU��o_|�R9Q6���V��bÙC������ٔ�}D^��Cf�')Y�z��TݔK��C�t�e��Ԉ��)�P��?(�/�` � 6A<%)�@���*!�Ьܭ�1��RJ)�8�`���B�C!HK0UI�'�cU�A] f����;4 - 3 ���_&'�kO��igP��AZ�4(l-��9ip�ݕRֺOv߆|+����/��2�*�|��%�<r�l�?��c�7���)��:�Y7�p\��	l0A2�H;�Og��(Vk�-JaD�Z�/���B��>����9�|��4�,s�07�7M=J )7jT8�im7�F�7�-hԨ�!ޕ6�X���{m[�ۨ��QR�a�`�2$��a��e�1e��@D�	ED�$)H��G��hCY+4�7G�d��4���$P!|~'��H�Z�a�2�	Pc[�n�"C�p�O��	�cz�6�~N5��Z�r�q U�w���aK3,�n�� G��)�M	RX���1q�B�����5㪉3%ٵ9d��󙳄.x��;H��Y�\z#�=7�
|�K��Ƶ5<��!��2"�X��u�%�݃.ͮKEd{&.tS<ݮ<(�O�y����~]��z�|�ؘ�}i�G��\�H�#r�$2Pb����t7$Ш��3���p�`�0�����c���e)N}���Y��a��G���1�g����aDp4�j2իe�5�W\��a	�R2�q�ЙLnJ�¯���h�����E�u-��9�G�1�L<iA��^_���ёF��F���#�ƕ.Z� �#�l�=ٽ��((�/�` � �@:E'���!���J��!�!MHh((p�A��A��ń��9Z��V��F�r�$nBR- - 4 3,_���<���q���̇�'P�����a8��6U����>�̳�9�|s�4�,s�0��2�+��28�IY�?�Xc�/�ص��'���Fo@���n��vsy�q)��*8�R_��{h�T*VkA�X-�&zh���9�����p�f2%H'���Δ�R2��yt]��q
qi����2z`�M3��R�Ǩ��[�$���p��!�1@aF��4�PED��H"
FD�������"	���jib*����P��]?��o�|4���zu���]��}��4S7JaG5����D�?̥��ߏT����ؖ��/}W/:m�m���t3.P^\��}��q��a^pF��[F4��1��g��;ȓ�>�6l���F/_�p�Ä�e�p�
��J�i�BX��o9�1h1�˪9y�F�y��d��,w�����(<�a��E��k�=�C�w��M( R����+-��`N�����~4��w4H��=i�� ��Q�6���� zz
�<�O]�����$9X\xb���@��T/\B�%]�F�3�}�u"�n�d�q�3�!�
��y� �/��Ƭ2�w��:�˽=��m�O!_���|���CW�_��}q��Bh��V���Qg(�/�`  THB�(�<���hM���U��Gɶ�����.������z�`��V�v���C&?.t�B_|�$�)0 7 8 2���7�+��2�'�,2�{�zc�O[Lqwi�!~�a���S"�~�/�λ���qz�*��ƎtB���^�����.0�,` ���g�w�9g�m���M�l��;e\T�v��0�L{��!�����Vt����ڮ�rwIvww��P~�nK����&�|(��	U���Q�LM�]zWۮܝ��څ^c�A�+��9#TL�!��@%�����$)�g���@b�t�3F1C1d	D$�@�	Ff����&�T�͜%�&1��a���Qu#~A�Ccn�w�w0��EAN�z>#���ښ�{��C��e@i:��ء�C����kv�M�d'�g�=�b���7��i~�0�Җ��� "�XѬ����C�) ���1��2���0�v��-~�W�R�mȔ�q��|�@�Lm����6�����﹭�O�S�B����$,��	�FAx�`��7[���m̽�-ѯQ��C����XKk!0ϰQ ��֦}K��	K؄"�K\G�铍8D��D����R�S�C��y���å�mKa�W/<���tW)��
)kQ��Zؕ{N��?S!1��%�fE���X�ik�;U�[|p��?���^���9�f d[�LHVC�"dJ�=��yh����EmS�d��W��9�F漷��R�������8�)�7���^)(�/�` % F3�9�2��D�«f	L]O%���֒���X@�$�Z���M, �?JFyaN �DCD�� � x �^Ha�*h��M�.�5}����|L23#���� @a�v;F^$3�v�����n�������tca�11��7&����$�y���P���d��*Ì*�衆J������z�y��u�9g�p��f�e��e�U��Bi[��C�#�4ZuQE���!-s�F	�V�]��T�f�� �e����p��oJ���ᬮ>��M�9������>]V������n\A���	L	��d���b����䌺Ӓ���,�OFfQkdkd��ѼJ'���(-��ȼ�`0�d�Fl#ÚY��,EybbQ֬�l�y�/2[�hPͣy2Z C����N(a�>�`�B]P�<��	P��Nl���^O6��f�MZ��k�lqs���m�߮����\��կ�د�ZZskY��~m���rr{��K�ԩ#�J���V7W+V�Nf�ͅ�[{�5k��L�3�,��1��/���-���+���J�_SJ��k�P>y۪m2+�K*�$�GY$�Cb2H ��Gw�1Go��F��(��a|��Y\Q�Q<����HuD��(�=��i5��-��K!���32""IQIA2�I�����	S
2#B"MAI�W�۬�M�n�
&���7}B6U�+�I�0ޣ=|\����*}å5[���0�K�W�7�"u�¼%��-����`�C���aU'U�G豯��S^ل�_�#�e�h�L�I�XAlKA\�&�$�߆�ѷF�J�N�*��A$Dj��a�Eu~����9D;քcW����n'��]�cQ]�Ʒ߈*��9�1��&:	)��X<L�&��%�q4��� 9e�v�9�`�RH���gl�j�3����ЌŹ�"QwK��l^Y[�F@ [�Mq��h�Q��k�}�m�x�<=̷t��1 V�/|�[�\qc�x������<*����T/�d��U�ݽ����d$��{�ڀ_��q}�l5��hIkC��~(1���'�6,IH`_v��<���R�{\}0qb�0-�\�l���Y`ќ��S�W�*�5���u"\!#��rr �u{ ����q"�oLt���1����<���9��	x�}x�wz<2'bd�x���	p�qa��_lZ9�t�-�С�(�/�` B 
~�*��30303����\�d]���bp�V���Մ��m�2Ɉ��s0�r/�r.�r-�r,�r+�r*�r)�r(r'or&_r%Or$?r#�����>~���{�����o�y!g���p_�@��>��<��:��8~�o�����q��8����]��-��+����]�iOq?q/qq�7�x�>x�Ջx����{x�s��kx�c��[x�S��Kx�C��;x�3��+x�#��x���x���^��f��^���d��cژ.���aZ������ҽ4/�K�ҹ4.}K�ҵ4-=K�ұ4,�J�ҭ4+�J�ҩ4��Ҧt)MJ�Ңt(�I{ҝ4'�Ikҙ4&}I[ҕ4%=IKґ4$�}#�H�H'҈�!mH҄� -HҀ��G��|��G��w�]G��s�G��o��F��k��;}F��e4=F��a4�E{�]4�%��޲��,˾���*�ʞ���(�~���&��^���$�>���-��-��w����n�v7�=d����[�f�r+7�^w�d��>v��c��:v��c��o�Ʈ�i�[�v�16�ݶ_l�m��,����*��V�i;�F�Ol��&�Gl�>n�.n�n�n�V��b�����as����ac���]aS���aC����`3����`#���]`���`������>� v���ۻ��{���̾�ʞ��~��^��>�������뼾뺞�~�^�>�����ꬾꪞ�~�^�>�����霾隞�~�^�>�����茾芞�~膞F:���:�����9�﹞�9�߹��9�Ϲ��9�����9�����9�����9����;v�t��N�ʂ�ʬڎ��pK��:�zo�����I /�ϸ�omY���w=[�qnZ��>٘m�hO��e�|����Ǯi2-]�zO��<$�=$��O�o����hoh3����o~���7��N���?�����ֈQh���Q(�&ϫ����M74uC��-e����&ul3��'����������������m�m���sQV��k�l���,3��^���\�����nS��E��6eK[�]��̆�+\s�p-vM_�:���ŏ�c�c�X��$ʦɔ�%{,�D�4��++U,��W�
T�[�)}FXW�sVƭrͷ�D�f�i銲rl������ՙ��/�T�2�d�	�T5����;�H5Um�9E����Ӡ��h�9����S8��;�Ƴ��̷%��~�������c��f��_���%���<�B�W�  ����3{2����e®���n�X�˺�\;a}/��J�m�ڔc��>�~�2nn�0��;/�^ܜ�BXw����e���O��{�qS�5�&�e�>[���l�'{$
��cX���>�8t�[w��An�\]��l��J���Nt�>cV��"h.ܒ�a�3f��vT��zD:w��l�1��rk�ā��JT�*y4�Ca��@$h4�Ca�"�Gc�8��y4�CaP5"��"��<�ġ0T�ȣ�H
�@U�<��a��G#P%�A�ZD�E�P�AU�����ៀ�k�q���Ե�8]:���|�p3��ikd��^Ss��2�]��.��1�v��@�`kO ���>e��暮m�Х�jC�:�mܤ�ke�ͱ�{���%�smC׸��o��l�o���Uf��1XtdDDD$I���D���`,��J�2(�#a3d�CF+5�z���w�;	L�����NUx�R�}�ȒGڼ�)%�R�fQ��ѪSI�ns���F��+� M3:lxɰ[���q����������q����o|���Ώ_9Ɵ�n���n~Aj�ST�zG��#�AYu�R�}#jԇ�u@�;;?���p'��ޢ��9�(5�ԍʘT#�Hϴ0���Ȉ�GY��o�I�!B������u(��*��g�pbg�S����w��t��s�^�o�MN�S�!$���ʶ�feW97Ap��}P2Kiu� Ftn� I7B�Ѽb5��Z�pϾ5��Z�:HA���Q_�N��l��}��2�o����}����- 6'_#��{��{������f�]�s�s%MG�f��XVY(�/�`�� fSD4�%j13030�S�0�{˞D��k�D�
�7��(d���c��2D�A�o���6 6 6 ̩T^.}u�.s0e�Y]���#�BF�9��^��5�F�9�sP������h�SN�Z��ժ�޻�������g���lm��Y3=k^@�4y^Ԝ�<*��{�����c�ͦ���I,��JT��
_9����+JZ�t���H�ND�ҺD���Ӄ�u�`�P(���� �@�:���³��R)��ʙ#�i���<���<  Aj�A�fʠ��<�gy��oe����Y�:����G�QL[7��`�g��m����5���v�C��Ʈu��p��E>�!c�XL��<�5�u���ab�RSCC        [remap]

importer="font_data_dynamic"
type="FontFile"
uid="uid://cg4lw51kbtnip"
path="res://.godot/imported/karmatic-arcade.regular.ttf-cf1dd96e5a7bfeb428b035e8970c4f97.fontdata"
             extends Node

var score = 0
var level = 1
var lives = 3
var lost_lvl = false
var randex = randi_range(0, 6)
var array = [randex]

signal show_screen

var hud_enabled = true
var maze = load("res://tile_map.tscn")


func clear_screen():
	get_tree().call_group("mobs", "queue_free")
	$Player.hide()
	$TileMap.clear()


func start_game():
	score = 0
	level = 1
	lives = 3
	lost_lvl = false
	$HUD.show_game_begin()


func new_game():
	score = 0
	level = 1
	lives = 3
	lost_lvl = false
	$HUD.update_score(score)
	next_level()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#func on_fringe_changed():


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		var new_maze = maze.instantiate()
		var existing_maze = get_children().filter(func(x):
			return "TileMap" in x.name)[0]
		existing_maze.queue_free()
		add_child(new_maze)
	


func next_level():
	$popups.hide_popup()
	lost_lvl = false
	$HUD.update_score(score)
	maze = load("res://tile_map.tscn")
	show_screen.emit()
	$Player._start($StartPosition.position)
	$ScoreTimer.start()
	$MobSpawner/SpawnTimer.set_paused(false)
	
	#await get_tree().create_timer(15.0).timeout
	#exit_found()


func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)
	if Globals.was_hit == true:
		lose_life()


func exit_found():
	$MobSpawner/SpawnTimer.set_paused(true)
	$ScoreTimer.stop()
	clear_screen()
	level += 1
	$popups.show_popup(randex)
	while (array.find(randex) != -1):
		randex = randi_range(0, 6)
	array.push_back(randex)
	


func lose_life():
	$MobSpawner/SpawnTimer.set_paused(true)
	$ScoreTimer.stop()
	Globals.was_hit = false
	clear_screen()
	lives -= 1
	lost_lvl = true
	$popups.show_popup(randex)
	while (array.find(randex) != -1):
		randex = randi_range(0, 6)
	array.push_back(randex)


func check_levels():
	
	$popups.hide_popup()
	
	if lives == 0:
		$HUD.show_game_over()
		clear_screen()
	
	elif lost_lvl == true:
		$HUD.show_level_over(lives, level)
		clear_screen()
	
	elif level == 4:
		$HUD.show_game_won()
		clear_screen()
	
	else:
		$HUD.show_level_won(level)
		clear_screen()


func check_start():
	if lives == 0 or level == 4:
		new_game()
	else:
		next_level()
   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Main.gd ��������   PackedScene    res://tile_map.tscn RdVMi��   PackedScene    res://player.tscn k9b�y�8   Script    res://MobSpawner.gd ��������   PackedScene    res://hud.tscn -6�ؙ��%   PackedScene    res://popups.tscn ��������      local://PackedScene_73j5s �         PackedScene          	         names "   -      Main    script    Node 
   ColorRect    anchors_preset    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    color    TileMap    Player 
   MobSpawns 
   MobSpawn1 	   position    spawn 	   Marker2D 
   MobSpawn2 
   MobSpawn3 
   ModSpawn4    MobSpawner    Node2D    SpawnTimer 
   wait_time    Timer    HUD    popups    StartPosition    ScoreTimer    show_character    show_screen    _show_maze    _on_spawn_timer_timeout 
   lose_life    hit    timeout    check_start    start_game    check_levels    finished_read    _on_score_timer_timeout    	   variants                            �?    ��    `��    T'F    ��E         ƿ??��#?  �?  �?                  
    ��C  �C
     bC @JD
     _D ��C
     �C �D              �@                  
     aD �mD      node_count             nodes     �   ��������       ����                            ����
                                 	      
                                    ���   	                   ���   
                         ����                     ����                            ����                            ����                            ����                             ����             	             ����                     ���                      ���                            ����                            ����              conn_count             conns     8           "   !                     "   #                  	   "   $                     &   %              
   	   '   $                     )   (                     +   *                     '   ,                    node_paths              editable_instances              version             RSRC   RSCC      �)  ?  7  3  (�/�` �A �q�=0hq���i�pr�k��[y�A�u]��dh�K�f�KD������B��jG�C��ii�Yc�<^J��'�4b6>����7�|�G�;;���=f;�K:�=~agG�mnGҼ˫k�ײ	+;S�iy��2mT��7g�t��9�N��㎄�5f���5�#OZ��i�H�,��u�]^]}y������#_��;�hޓ�ބ��ޔ���w��4v�g#���>��䳳א���N��R�۸�42;=��F7�|���ʘ;�I��D��M�1���"��+���8���K�m����K���4���m��y���^*���;G���cY�3a��1������|��Nsg�����i��َ|�y��{ߙ<�=���(�F�e�؏�6y���'��[��;�z�c������������H��~yy��e�X~c��F��4����o{��������y�'~������^��`�~�wߟ���k�}��?��� �����e��^�߫S[�)�y�#��	|��<k䅿&_�j����~��o`4j(n?�M�br�fɳ�S�����Ui����*{��3�Em�w�ӫl�������gZ?A���W��)c�,F����*�/�?���=�M鿜�?S�L��W��6���gb��n�mj��f���R��F3�Z���j��}������n��#$�K+W�Tz�b|�@�p�r��jv4ڜ��K�O���~�ir�1��Y���-;n�u�8��߄�Z�󊬘���K�Sa'���>���d����
��Q�ٚ]���H��S�N9pܼi�F�4g�<�2c��*O�"乚QF/\�`�"��"��&J�!"���:�q۠!�b*P�&�����,P���5�Y�(@�j P�UՏj*� _��ӵ��oyI��cG�W�6N���/���{�+��G�T��4>�T�������cP�0�O"�Dn���Ar���'���y�e�̜��;sqsy�������a�Q�F��b�QQet���6��B�F��, �Yp],��k�(���I���m�m��am.�>��-M�.T�:f	��S�V�
���`�+�z�\���r�\*7N���Q����?����ֱ�6�)6������R�=��b�Xʎ�~yE�Js�nSv4�_�sf��	}>�u�L�u�д���k�U?�O�a��!��a�0�o��A�G�Y��^�~q7��>��'�Y���N�a�_p$��1�����_��uF���o��kQ-���.�5�8�ۺ�֟��0�/������5��[��온8�����/����*���i��]q��]d�j��_�5���ש��G���'��zzX�P�H<?�'	ύ�w�ǀ7�������aٹ�\��v[����[����uJt8t+tt:ݤ�O����6[-W�k-���'[�e�i,���b=�r+�̺c��u])���9��������Ji��K����b)Vݙv�Mh��A��[l�-��ǟ����_ɂ�K���	�%F��@����?�ϙ����`��t���Sș���$I�p���q�uA*�R2#$)��~��C*y ���Be}�a��>M��6���t�;uE���ݽ�Tl� J0�ʘ�D�w;[�v���<)�&&($��JX,iވ�Sz^, r���"K���-�U҆1��!�C�8��bد��E�m��������A�;��T��578��ك��;��~�0�
�Dv��5�Ō����:mgS����K�~�!W�� d��$���iK��29�#��U|��u���C���5g�1��E,�#LI��(����T�����1Ǒ��mޘ���0R|���q\JKѝ/�Vw�bIU�i�m�X�ؒ�z@��M1ED�#�w�"��n�ҙ|CƿU������Ê�%GU��6J���� wk���"A@+f���!L~��+	��S�]�O��o�ô�U�tC�*
���^�]M��H$� ۺ^6�'h��%����1?\�@�~nb�x��/��T��p,&A��*jB��|j
%BR�k2*&FƏ(�/�` m1 F�z(�%I��  �����?���Zvo�g�֤eOkO#do)Sj j s ?[܇��t�>؇�m<[��8��3�ݶ�n���moF�Z� �TY2A���8�]�����ޛ���n�_o)���:�L'�Zj��Υʳ�ɥ�!�<{�>��b7�m��^7�B�-�,��fĸ�D��Y*v ��
M�%U���װ���ܘ8���F;�D���Q���9:�rs��Mow�m�#Z(Q�������n��5�L�)U��BZ�	Z�ъ)a��&��������;��8�ahr��s[�w�"K�|BK)�:(�]����k�]L+h���-��6��5aI&J|��&:�D		 -��z��M�d��MãA!��q+-�C:�x+�y�7��L�3@P%��P~�^s-+�ޜI×K���}�5i+QS� >R��c5�+�7�}@b ��B�]6 ����`�
-_G��@\a�-%@v�`E���Ӟ9��$)d����`*��v1'��٤P��_W�AD�\��ى��7���S��WIxz� >m{gJ}�m&��r ��A�� wdb^�Ͻ'�����<t��ԑoy4��c�M>�������?K���I���і�dO���8�*W>���V���}˥�q��n@��:5�����[��Tt����PC�9�֎�<�S�!�a���]�N=|M"��N���[�U�D��y���Tߊ��]��YYU���~�e1j*���H�R����Փ6�`�%j6�7!��ӿ	.��s!���"�?��G���u�{K<��Z�;
�<0'����6��_�L�*�_Ϛ�؞�����9���NJш��$1�*��I�s�������$�)?-1�(�";�1S���P�jzc7i�6D���.!#-+<��<�K�Nh�M��YY;���m��C�p�q4���#I*QB�e^��O�[ѫS�-[�Y��	r�x~UL.=E�b�p�������a�$$4�%�=%w��-�c�u͟��I{���փ�N.tA��::e��7���^S�p�Ұ�y-<Tط���[^�4�<#-
�����(�5������;�+/I6��yB�?�þ �@�(�S���mV�/f2&�M�tm3)�;��-����[�׍���� F���[�|G<���*�$�k���- S�*~��Y��=���(Q����>zHy��F�R��"l�eN�w�>��,Ϛdߣ8��T!|���i�h���׀xBz(M�a�̴&a ���"t<y�x��L�σIi�l�S��R�������H�.�e�����・i�K���b�):ʜ���4�f<*��0ԹK�W��"�޿ R���O��z4��[pI=�� �G���>���a��7se�ك�S��ەR84��V5cͮ}Ndɽ��ܵ9���Xp��,�P*��̈́]��p���:2��; T0Ɵg7��s/��աӦ����I��\�p�� AЛ�p)U�ߥ�� �=��X���=6K5K��#(��Jv��V*(��@��Ы�X�H�ƍ�QNi(�/�`�M) �E@- nI:��m�*����*�f�Y�?3�N�N6�1����4f���!d�� � � ����6{;�G�H$٫��9d����ۨ��艮�3F�Q3�͸�x����Q5���K���m�d�&:���K����m�6vn�ͽ�gz�'���J�,�Y-kً���/�e�1j��/;�Y�?�7�d��ݾ�>>6Q5SS=��`���ݍ��`a�7ߘ1�Ȓ�=6����q&�ٛ�虚誚s+j��zMԼ�y2g;x�U.�g���/��}����͓�s���q�����qۋ{A�ԞW����%��e�(1��q��{��>����u�����֭��T~?��eu���D�8w���b�d��n�<c���'^��LM���`���9���z�/��]�3����km&�ܮ�z��6�i7~������j�e~{����[]S3�tN�;7vb/��9�X��.gs1vaGs,o�/��<�s9�1����9�ky������;��9��7n�5N�3N<{�q�����x�����x�����x�����x���������^���������+��>������sg�W��rGw�'8���8����~��óݼ��]�ip�v��=x /O�;�dw{�����ި�"�b��
R;?��P�Gqw~p ��'��|K��������$))��/���'��]�Ӝ��<��\�����<�]�#=��\^�W��~藮�n��t������괾�{x\w�[�uB��׺�7���*��E��)��'�r'��&gr%_�$���#���y��ȇ<ȅ��{}ׁ�O=����.�>�������雮wO��2�{�
��A�c�FD�I*�a@c�Y��RE�$)���x�o�t�q��.W�A��קf�Fb�IԹK�2�	�ث
�f�/s��6�	��B?�_&ݽI�����V��v��#�L�߁�0�o*7՛8�A+�L�[�G:^-o?%�;���l���d=Br���-r� ���nzV��fd�=�΋�&�v֥�h��4�T/e��㝈[�A�m����p��#b�4���� �C�?���C�ϜK+ľ
gk�aS7��&Q���v/͎T��� ���H�<ጽD�u�ص�-��\Ê$��`ئT��6�|��u~Bd/4�f&�
��(�X��˯�� )��?Oߡ��u[�
��n����'l���������6C'�����[J]��.#�����m���>�c˪x3����7���k�2,���`2.���'�! M�<JWRSCC       [remap]

importer="font_data_dynamic"
type="FontFile"
uid="uid://dnnipmexklcup"
path="res://.godot/imported/manaspc.ttf-047416f90850ca6415b559d0971e59cb.fontdata"
             extends TileMap
class_name MazeGen


var starting_pos = Vector2i()
const main_layer = 0
const normal_wall_atlas_coords = Vector2i(10, 4)
const walkable_atlas_coords = Vector2i(5, 1000)
const SOURCE_ID = 0
var spot_to_letter = {}
var spot_to_label = {}
var current_letter_num = 65
#const label = preload("res://simple_label.tscn")

@export var y_dim = 35
@export var x_dim = 35
@export var starting_coords = Vector2i(0, 0)
var adj4 = [
	Vector2i(-1, 0),
	Vector2i(1, 0),
	Vector2i(0, 1),
	Vector2i(0, -1),
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _show_maze():
	y_dim = Globals.grid_size_y
	x_dim = Globals.grid_size_x
	Globals.letters_to_show.clear()
	place_border()
	dfs(starting_coords)

func _input(event: InputEvent) -> void:
	pass
#	if Input.iaction_just_pressed("reset"):
#		get_tree().reload_current_scene()
	
	
func place_border():
	for y in range(-1, y_dim):
		place_wall(Vector2(-1, y))
	for x in range(-1, x_dim):
		place_wall(Vector2(x, -1))
	for y in range(-1, y_dim + 1):
		place_wall(Vector2(x_dim, y))
	for x in range(-1, x_dim + 1):
		place_wall(Vector2(x, y_dim))


func delete_cell_at(pos: Vector2):
	set_cell(main_layer, pos)
	
	
func place_wall(pos: Vector2):
	set_cell(main_layer, pos, SOURCE_ID, normal_wall_atlas_coords)


func will_be_converted_to_wall(spot: Vector2i):
	return (spot.x % 2 == 1 and spot.y % 2 == 1)
	
	
func is_wall(pos):
	return get_cell_atlas_coords(main_layer, pos) in [
		normal_wall_atlas_coords
	]


func can_move_to(current: Vector2i):
	return (
			current.x >= 0 and current.y >= 0 and\
			current.x < x_dim and current.y < y_dim and\
			not is_wall(current)
	)


func dfs(start: Vector2i):
	var fringe: Array[Vector2i] = [start]
	var seen = {}
	while fringe.size() > 0:
		var current: Vector2i 
		current = fringe.pop_back() as Vector2
		Globals.letters_to_show.pop_front()
		if current in seen or not can_move_to(current):
			if Globals.show_labels and Globals.step_delay > 0:
				await get_tree().create_timer(Globals.step_delay).timeout
			continue
			
		seen[current] = true
		if current in spot_to_label:
			for node in spot_to_label[current]:
				node.queue_free()
##			var existing_letter = find_child(spot_to_letter[current])
#			if existing_letter != null:
#				existing_letter.queue_free()
		if current.x % 2 == 1 and current.y % 2 == 1:
			place_wall(current)
			continue
			
		set_cell(main_layer, current, SOURCE_ID, walkable_atlas_coords)
		if Globals.step_delay > 0:
			await get_tree().create_timer(Globals.step_delay).timeout
		
		
		var found_new_path = false
		adj4.shuffle()
		for pos in adj4:
			var new_pos = current + pos
			if new_pos not in seen and can_move_to(new_pos):
				var chance_of_no_loop = randi_range(1, 1)
				if Globals.allow_loops:
					chance_of_no_loop = randi_range(1, 5)
				if will_be_converted_to_wall(new_pos) and chance_of_no_loop == 1:
					place_wall(new_pos)
				else:
					found_new_path = true
					fringe.append(new_pos)
					
				
		#if we hit a dead end or are at a cross section
		if not found_new_path:
			place_wall(current)
        RSRC                    PackedScene            ��������                                                  ..    AnxietyWalkSprite    .    frame    resource_local_to_scene    resource_name    script/source    custom_solver_bias    radius    script    length 
   loop_mode    step    tracks/0/type    tracks/0/imported    tracks/0/enabled    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/keys    _data 	   _bundled    
   Texture2D    res://Crab_Run.png ��C��      local://GDScript_sphry          local://CircleShape2D_pvbu7 0         local://Animation_nm1jn Z         local://Animation_x2tbl R         local://Animation_kosel �         local://AnimationLibrary_riw26 �	         local://PackedScene_t67vb M
      	   GDScript            # Citation: https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html
# Citation: https://docs.godotengine.org/en/stable/getting_started/first_2d_game/04.creating_the_enemy.html
# Mob Images by Admurin: https://admurin.itch.io/enemy-galore-1
extends RigidBody2D

var screen_size = get_viewport_rect().size
var min_speed = 50
var max_speed = 250
var mob_speed = 0


# Set randomness in the anxiety mob's speed for unexpected actions
func _set_random_speed():
	mob_speed = randf_range(min_speed, max_speed)
	return mob_speed

func _physics_process(delta):
	# Get the player's position from the globally acessible singleton
	var player_pos = GameSingleton.player_position
	$AnxietyAnimations.play("anxiety_walk")
	if player_pos != Vector2():
		# Calculate the direction vector from the mob to the player
		var direction = (player_pos - global_position).normalized()
		linear_velocity = direction * _set_random_speed()

func _on_body_entered(body):
	if body.is_in_group("player"):
		Globals.was_hit = true
		
		
    CircleShape2D          �9w@	      
   Animation 	   
      o�:         value                                                                   times !                transitions !        �?      values                    update       	      
   Animation             anxiety_death 	      
   Animation             anxiety_walk                ��L>         value                                                                   times !      ��̾���>  �?      transitions !        �?  �?  �?      values                                update       	         AnimationLibrary                   RESET                anxiety_death                anxiety_walk          	         PackedScene          	         names "         Anxiety Mob    collision_layer    gravity_scale    script    metadata/_edit_group_    mobs    RigidBody2D    CollisionShape2D 	   position 	   rotation    scale    shape    AnxietyWalkSprite    texture    offset    hframes    vframes 	   Sprite2D    AnxietyAnimations 
   root_node 
   libraries    AnimationPlayer    _on_body_entered    body_entered    	   variants                                    
   T  �  �A   ��?
   33S@33S@         
      @   @          
     @@                                                         node_count             nodes     ;   ��������       ����                                                ����         	      
                              ����   
         	      
                                 ����                         conn_count             conns                                       node_paths              editable_instances              version       	      RSRC  # Citation: https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html
extends Node2D

	
func _on_spawn_timer_timeout():
	# Instantiate the mob scene for spawning 
	var mob_scene = load('res://mob.tscn')
	
	var mob_instantiate = mob_scene.instantiate()
	mob_instantiate.set_contact_monitor(true)
	mob_instantiate.set_max_contacts_reported(10)
	self.add_child(mob_instantiate)

	# Select one of the various mob spawn positions randomly to spawn the mob
	var spawn_points = get_tree().get_nodes_in_group('spawn')
	if spawn_points.size() > 0:
		var random_index = randi() % spawn_points.size()
		var spawn_position = spawn_points[random_index].global_position
		mob_instantiate.global_position = spawn_position
	$SpawnTimer.start()
	

		
# A mob spawns every 7 seconds
func _ready():
	pass
              RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_bkuh6 �          PackedScene          	         names "         Node    	   variants              node_count             nodes        ��������        ����              conn_count              conns               node_paths              editable_instances              version             RSRC        # Citation: https://docs.godotengine.org/en/stable/getting_started/first_2d_game/02.player_scene.html
# Character Images by Antifarea: https://opengameart.org/content/twelve-more-16x18-rpg-character-sprites

extends CharacterBody2D
signal hit
signal move


# Establish how fast the player will move (pixels/sec)
@export var speed = 300  
var screen_size

# Call when the node enters the scene tree for the first time
func _ready():
	pass

func show_character():
	# hide()
	screen_size = get_viewport_rect().size
	_start(screen_size / 2)
	# Use the singleton to assign player for others to access
	GameSingleton.player = self


# Move the player by detecting associated keyboard presses with up, down, etc.
func _process(delta):
	var velocity = Vector2.ZERO
	# Use the singleton to assign player position for others to access
	GameSingleton.player_position = global_position

	var collision := move_and_collide(velocity * delta)
	if collision:
		#print("I collided with ", collision.get_collider().name)
		pass
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1	
	position += velocity * delta * speed
	
	# Animate the player based on direction of movement
	if velocity.x > 0:
		$AnimatedSprite2D.animation = "walk_right"
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "walk_left"
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "walk_up"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "walk_down"
	if abs(velocity.x) > 1 or abs(velocity.y) > 1: 
		velocity = 0




	
func _on_body_entered(body):
	# Make the player disappear after being hit by a mob then a signal is emitted
	print(body, " entered")
	#hide() 
	hit.emit()
	# Disable the player's collision so that the hit signal is not hit more than once
	$CollisionShape2D.set_deferred("disabled", true)


# Call to reset the player when starting a new game
func _start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	move.emit()	
    RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    atlas    region    margin    filter_clip    script    animations    custom_solver_bias    size 	   _bundled       Script    res://player.gd ��������
   Texture2D    res://Character.png O@�jȞ      local://AtlasTexture_wn7rk          local://AtlasTexture_dy8vt c         local://AtlasTexture_cjiu1 �         local://AtlasTexture_7inig �         local://AtlasTexture_mhsis 2         local://AtlasTexture_kvsem w         local://AtlasTexture_bqxl4 �         local://AtlasTexture_5h77f          local://SpriteFrames_alulf F         local://RectangleShape2D_gs5fv �         local://PackedScene_nm44k +	         AtlasTexture                         @  B  �A  �A         AtlasTexture                        B  B  �A  �A         AtlasTexture                        �?  XB  �A  �A         AtlasTexture                        B  XB  �A  �A         AtlasTexture                         @  �A  �A  �A         AtlasTexture                        B  �A  �A  �A         AtlasTexture                        �?      �A  �A         AtlasTexture                        B      �A  �A         SpriteFrames                         name ,   
   walk_down       speed      �@      loop             frames                   texture              	   duration      �?            texture             	   duration      �?            name ,   
   walk_left       speed      �@      loop             frames                   texture             	   duration      �?            texture             	   duration      �?            name ,      walk_right       speed      �@      loop             frames                   texture             	   duration      �?            texture             	   duration      �?            name ,      walk_up       speed      �@      loop             frames                   texture             	   duration      �?            texture             	   duration      �?         RectangleShape2D    	   
     �A  �A         PackedScene    
      	         names "         Player 	   position    collision_layer    script    metadata/_edit_group_    player    CharacterBody2D    AnimatedSprite2D    scale    sprite_frames 
   animation    CollisionShape2D    shape    	   variants    
   
         �@                      
   ����    
   j��?���?         ,      walk_up 
      ?   ?      	         node_count             nodes     *   ��������       ����                                                ����               	      
                        ����            	             conn_count              conns               node_paths              editable_instances              version             RSRC        extends CanvasLayer


signal finished_read


var array = [#source: https://adaa.org/understanding-anxiety/facts-statistics
	"\"40 million adults are affected by anxiety disorders in the United States\" (ADAA).",
	"\"Nearly one-half of those diagnosed with depression are also diagnosed with an anxiety disorder\" (ADAA).",
	"\"Anxiety disorders develop from a complex set of risk factors, including genetics, brain chemistry, personality, and life events\" (ADAA).",
	#source: https://www.who.int/news-room/fact-sheets/detail/anxiety-disorders#:~:text=Key%20facts,onset%20during%20childhood%20or%20adolescence.
	"\"Anxiety disorders are the world's most common mental disorders\" (WHO).",
	"\"More women are affected by anxiety disorders than men\" (WHO).",
	"\"Symptoms of anxiety often have onset during childhood or adolescence\" (WHO).",
	"\"Approximately 1 in 4 people with anxiety disorders receive treatment for this condition\" (WHO).",
]


func hide_popup():
	$NextButton.hide()
	$Popup.hide()
	
func show_popup(index):
	$Popup.text = array[index]
	$Popup.show()
	await get_tree().create_timer(1.0).timeout
	$NextButton.show()


func _on_next_button_pressed():
	$NextButton.hide()
	$Popup.hide()
	finished_read.emit()
	
func _ready():
	hide_popup()
      RSRC                    PackedScene            ��������                                            	      resource_local_to_scene    resource_name    device    action    pressed 	   strength    script    events 	   _bundled       Script    res://popups.gd ��������	   FontFile    res://manaspc.ttf �it��ep      local://InputEventAction_0eptv �         local://Shortcut_7ph4n �         local://PackedScene_r8mac '         InputEventAction       ,      button_pressed       	   Shortcut                                PackedScene          	         names "         popups    script    CanvasLayer    Popup    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    theme_override_fonts/font $   theme_override_font_sizes/font_size    text    horizontal_alignment    vertical_alignment    autowrap_mode    Label    NextButton 	   shortcut    Button    _on_next_button_pressed    pressed    	   variants                             ?    ��    ���    �D    ��C                  0      �   "Anxiety disorders develop from a complex set of risk factors, including genetics, brain chemistry, personality, and life events" (ADAA).                        �?     ��      �     �@          8                  Next       node_count             nodes     U   ��������       ����                            ����                                 	      
                                       	      
                                       ����                                 	      
                                                          conn_count             conns                                      node_paths              editable_instances              version             RSRC    RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_abyyn �          PackedScene          	         names "   
      tileset    Node2D    0    hframes    vframes    frame 	   Sprite2D    1 	   position    2    	   variants                   
      A          
     �A                node_count             nodes     2   ��������       ����                      ����                                         ����                                           	   ����                                      conn_count              conns               node_paths              editable_instances              version             RSRC        RSRC                    PackedScene            ��������                                                 resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/0 &   0:0/0/physics_layer_0/linear_velocity '   0:0/0/physics_layer_0/angular_velocity    0:0/0/script    1:0/0 &   1:0/0/physics_layer_0/linear_velocity '   1:0/0/physics_layer_0/angular_velocity    1:0/0/script    2:0/0 &   2:0/0/physics_layer_0/linear_velocity '   2:0/0/physics_layer_0/angular_velocity    2:0/0/script    3:0/0 &   3:0/0/physics_layer_0/linear_velocity '   3:0/0/physics_layer_0/angular_velocity    3:0/0/script    4:0/0 &   4:0/0/physics_layer_0/linear_velocity '   4:0/0/physics_layer_0/angular_velocity    4:0/0/script    5:0/0 &   5:0/0/physics_layer_0/linear_velocity '   5:0/0/physics_layer_0/angular_velocity    5:0/0/script    6:0/0 &   6:0/0/physics_layer_0/linear_velocity '   6:0/0/physics_layer_0/angular_velocity    6:0/0/script    7:0/0 &   7:0/0/physics_layer_0/linear_velocity '   7:0/0/physics_layer_0/angular_velocity    7:0/0/script    8:0/0 &   8:0/0/physics_layer_0/linear_velocity '   8:0/0/physics_layer_0/angular_velocity    8:0/0/script    9:0/0 &   9:0/0/physics_layer_0/linear_velocity '   9:0/0/physics_layer_0/angular_velocity    9:0/0/script    10:0/0 '   10:0/0/physics_layer_0/linear_velocity (   10:0/0/physics_layer_0/angular_velocity    10:0/0/script    11:0/0 '   11:0/0/physics_layer_0/linear_velocity (   11:0/0/physics_layer_0/angular_velocity    11:0/0/script    12:0/0 '   12:0/0/physics_layer_0/linear_velocity (   12:0/0/physics_layer_0/angular_velocity    12:0/0/script    0:1/0 &   0:1/0/physics_layer_0/linear_velocity '   0:1/0/physics_layer_0/angular_velocity    0:1/0/script    1:1/0 &   1:1/0/physics_layer_0/linear_velocity '   1:1/0/physics_layer_0/angular_velocity    1:1/0/script    2:1/0 &   2:1/0/physics_layer_0/linear_velocity '   2:1/0/physics_layer_0/angular_velocity    2:1/0/script    3:1/0 &   3:1/0/physics_layer_0/linear_velocity '   3:1/0/physics_layer_0/angular_velocity    3:1/0/script    4:1/0 &   4:1/0/physics_layer_0/linear_velocity '   4:1/0/physics_layer_0/angular_velocity    4:1/0/script    5:1/0 &   5:1/0/physics_layer_0/linear_velocity '   5:1/0/physics_layer_0/angular_velocity    5:1/0/script    6:1/0 &   6:1/0/physics_layer_0/linear_velocity '   6:1/0/physics_layer_0/angular_velocity    6:1/0/script    7:1/0 &   7:1/0/physics_layer_0/linear_velocity '   7:1/0/physics_layer_0/angular_velocity    7:1/0/script    8:1/0 &   8:1/0/physics_layer_0/linear_velocity '   8:1/0/physics_layer_0/angular_velocity    8:1/0/script    9:1/0 &   9:1/0/physics_layer_0/linear_velocity '   9:1/0/physics_layer_0/angular_velocity    9:1/0/script    10:1/0 '   10:1/0/physics_layer_0/linear_velocity (   10:1/0/physics_layer_0/angular_velocity (   10:1/0/physics_layer_0/polygon_0/points    10:1/0/script    11:1/0 '   11:1/0/physics_layer_0/linear_velocity (   11:1/0/physics_layer_0/angular_velocity    11:1/0/script    12:1/0 '   12:1/0/physics_layer_0/linear_velocity (   12:1/0/physics_layer_0/angular_velocity    12:1/0/script    0:2/0 &   0:2/0/physics_layer_0/linear_velocity '   0:2/0/physics_layer_0/angular_velocity    0:2/0/script    1:2/0 &   1:2/0/physics_layer_0/linear_velocity '   1:2/0/physics_layer_0/angular_velocity    1:2/0/script    2:2/0 &   2:2/0/physics_layer_0/linear_velocity '   2:2/0/physics_layer_0/angular_velocity    2:2/0/script    3:2/0 &   3:2/0/physics_layer_0/linear_velocity '   3:2/0/physics_layer_0/angular_velocity    3:2/0/script    4:2/0 &   4:2/0/physics_layer_0/linear_velocity '   4:2/0/physics_layer_0/angular_velocity    4:2/0/script    5:2/0 &   5:2/0/physics_layer_0/linear_velocity '   5:2/0/physics_layer_0/angular_velocity    5:2/0/script    6:2/0 &   6:2/0/physics_layer_0/linear_velocity '   6:2/0/physics_layer_0/angular_velocity    6:2/0/script    7:2/0 &   7:2/0/physics_layer_0/linear_velocity '   7:2/0/physics_layer_0/angular_velocity    7:2/0/script    8:2/0 &   8:2/0/physics_layer_0/linear_velocity '   8:2/0/physics_layer_0/angular_velocity    8:2/0/script    9:2/0 &   9:2/0/physics_layer_0/linear_velocity '   9:2/0/physics_layer_0/angular_velocity    9:2/0/script    10:2/0 '   10:2/0/physics_layer_0/linear_velocity (   10:2/0/physics_layer_0/angular_velocity (   10:2/0/physics_layer_0/polygon_0/points    10:2/0/script    11:2/0 '   11:2/0/physics_layer_0/linear_velocity (   11:2/0/physics_layer_0/angular_velocity    11:2/0/script    12:2/0 '   12:2/0/physics_layer_0/linear_velocity (   12:2/0/physics_layer_0/angular_velocity    12:2/0/script    0:3/0 &   0:3/0/physics_layer_0/linear_velocity '   0:3/0/physics_layer_0/angular_velocity    0:3/0/script    1:3/0 &   1:3/0/physics_layer_0/linear_velocity '   1:3/0/physics_layer_0/angular_velocity    1:3/0/script    2:3/0 &   2:3/0/physics_layer_0/linear_velocity '   2:3/0/physics_layer_0/angular_velocity    2:3/0/script    3:3/0 &   3:3/0/physics_layer_0/linear_velocity '   3:3/0/physics_layer_0/angular_velocity    3:3/0/script    4:3/0 &   4:3/0/physics_layer_0/linear_velocity '   4:3/0/physics_layer_0/angular_velocity    4:3/0/script    5:3/0 &   5:3/0/physics_layer_0/linear_velocity '   5:3/0/physics_layer_0/angular_velocity    5:3/0/script    6:3/0 &   6:3/0/physics_layer_0/linear_velocity '   6:3/0/physics_layer_0/angular_velocity    6:3/0/script    7:3/0 &   7:3/0/physics_layer_0/linear_velocity '   7:3/0/physics_layer_0/angular_velocity    7:3/0/script    8:3/0 &   8:3/0/physics_layer_0/linear_velocity '   8:3/0/physics_layer_0/angular_velocity    8:3/0/script    9:3/0 &   9:3/0/physics_layer_0/linear_velocity '   9:3/0/physics_layer_0/angular_velocity    9:3/0/script    10:3/0 '   10:3/0/physics_layer_0/linear_velocity (   10:3/0/physics_layer_0/angular_velocity    10:3/0/script    11:3/0 '   11:3/0/physics_layer_0/linear_velocity (   11:3/0/physics_layer_0/angular_velocity (   11:3/0/physics_layer_0/polygon_0/points    11:3/0/script    12:3/0 '   12:3/0/physics_layer_0/linear_velocity (   12:3/0/physics_layer_0/angular_velocity    12:3/0/script    0:4/0 &   0:4/0/physics_layer_0/linear_velocity '   0:4/0/physics_layer_0/angular_velocity    0:4/0/script    1:4/0 &   1:4/0/physics_layer_0/linear_velocity '   1:4/0/physics_layer_0/angular_velocity    1:4/0/script    2:4/0 &   2:4/0/physics_layer_0/linear_velocity '   2:4/0/physics_layer_0/angular_velocity    2:4/0/script    3:4/0 &   3:4/0/physics_layer_0/linear_velocity '   3:4/0/physics_layer_0/angular_velocity    3:4/0/script    4:4/0 &   4:4/0/physics_layer_0/linear_velocity '   4:4/0/physics_layer_0/angular_velocity    4:4/0/script    5:4/0 &   5:4/0/physics_layer_0/linear_velocity '   5:4/0/physics_layer_0/angular_velocity    5:4/0/script    6:4/0 &   6:4/0/physics_layer_0/linear_velocity '   6:4/0/physics_layer_0/angular_velocity    6:4/0/script    7:4/0 &   7:4/0/physics_layer_0/linear_velocity '   7:4/0/physics_layer_0/angular_velocity    7:4/0/script    8:4/0 &   8:4/0/physics_layer_0/linear_velocity '   8:4/0/physics_layer_0/angular_velocity    8:4/0/script    9:4/0 &   9:4/0/physics_layer_0/linear_velocity '   9:4/0/physics_layer_0/angular_velocity    9:4/0/script    10:4/0 '   10:4/0/physics_layer_0/linear_velocity (   10:4/0/physics_layer_0/angular_velocity (   10:4/0/physics_layer_0/polygon_0/points    10:4/0/script    11:4/0 '   11:4/0/physics_layer_0/linear_velocity (   11:4/0/physics_layer_0/angular_velocity    11:4/0/script    12:4/0 '   12:4/0/physics_layer_0/linear_velocity (   12:4/0/physics_layer_0/angular_velocity    12:4/0/script    script    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping     physics_layer_0/collision_layer 
   sources/0    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level 	   _bundled    
   Texture2D #   res://voxelExpansion_tilesheet.png R6��ֿis   Script    res://maze_gen.gd ��������   Script    res://Camera2D.gd ��������   !   local://TileSetAtlasSource_u020a T          local://TileSet_vrysw w-         local://PackedScene_fh8xn �-         TileSetAtlasSource                   -   @   @                
           	          
                   
                                        
                                        
                                        
                                        
                                         
           !          "      #          $   
           %          &      '          (   
           )          *      +          ,   
           -          .      /          0   
           1          2      3          4   
           5          6      7          8   
           9          :      ;          <   
           =          >      ?          @   
           A          B      C          D   
           E          F      G          H   
           I          J      K          L   
           M          N      O          P   
           Q          R      S          T   
           U          V      W          X   
           Y          Z      [          \   
           ]          ^      _          `   
           a          b      c          d   
           e          f   %         �   �   B   �   B   B   �   Bg      h          i   
           j          k      l          m   
           n          o      p          q   
           r          s      t          u   
           v          w      x          y   
           z          {      |          }   
           ~                �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �   %         �   �   B   �   B   B   �   B�      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �   %         �   �   B   �   B   B   �   B�      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
                                     
                      %         �   �   B   �   B   B   �   B                
           	         
                
                                 TileSet      -   @   @                               PackedScene         	         names "   	      TileMap 	   position    scale 	   tile_set    format    script    y_dim    x_dim 	   Camera2D    	   variants       
     �B  �B
   ff�>ff�>                           =   
    �KD �5D               node_count             nodes         ��������        ����                                                                ����                         conn_count              conns               node_paths              editable_instances              version            RSRC   extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
  GST2   @  @     ����               @@       xR RIFFpR WEBPVP8LcR /?�O͠m�6��M�_��7D�v��m�D���$�^�i�(+�$�"�7��
n�*���J+�ݭ��o����籁[۶��wC쿒)�T��	/x�$�5��m[u�1�~h�]�Kp�.C13K~�IÓ�c����Z_3SD���M��"�{�؁�q��Jah�
6TD  É^=Py��a����j�P�G&H�0��kT^���|�� :��d2��|�Em"��LGt�Fl~�P���iLH2S�P�F���Lr78ލ��R�� �D��56?l$��$��	5�L�d\�rJ�(�%�0���B_X�'a6�"6(b�\82�]���P_��`(8�O��<��1���AI7�a2���Q/T�R�0&Ҙxi,<\�=��=(��! '�JåQl?�� $5�o��������c\|�R�|��G��
��V�61:�x[yj�$^�S�����୰�V(�H8�ɘàmA�����S��	��]K͵��s���%ϔ�G���J��b�����n�jɱ�+u�+�dw�5�A�/�r�{���9��9hBH�D2�� �
J��2-��F���Ԙ��n��T��Y=�<xi,E�rzP�K�C���I%)�$K��yo�{���}��[�>�B��C���4�����;�R
CHL�@����,Ovؖ*����ދ��������h�Y�&B�1�'kۮ�ņLdWFf&�����ڰ�_/�m������sf$�T��!镩`�LA�e�en�rv�h�s�aTn�V�0��Y2Ӯ�3��9�_lж�n���~�Pi��Ce$
��x8.��lQ�ml?ҳ��h��� C$���m�yҠ�++�J���4�N������s�D�V���@��mλ����a��Zj#�s��'�)*P�D��R	��lp��<rl�L�<�Ɲ&xnjn��<�/7��۾�q��Ȳ�� 	E0-����"P**pN���>�^��^{���q�����������u��d��!&de	 01�a����.,��P��R˦R�֢wm�x��߂�ŸU�B2�Țe�df�ٗ���p���������;g���Viw���Y��!��`��;��{z/�7qzy�ޫs��_����{6!�r�4۸ B�Yi�vwf�9?���s�X��=��?������ᦥ�>+���5B/��{jB1,��KL2Hz���%���Sֵ���t��}4)������9��s�f$J���ᾂ��jC%K�l��߶��[���̣�u2�����׫����w�����N/�G�V��s��H�x����$m���Q[t�6
���,�X [�`5���E0�G*�9:}fDfit���\[۳=�>��K2�U�ܹ��U0���)���F�����Q����
�:�����u���Ͷ}��  dDIV��ҲrJ�tr��.���le�l[�8_¹���W�n�>uZ��ȽJ��@ m�5��o �,[ب�ݶ����� AP�$0Q�eɔ���ݻV�n��.{�u7{G�Ͷ�=��d���N��)���EڤE�y�{�ޭm[�6۶e;�󔅶�4nzn�����y�	3�I�t�Am���mrooସ��϶St����{�4���ஏH*��4H�ܡw�z��l%I��fqG@ A�\�u�H�ˠ<���ג�~�~�,�j  �bhB�AU�1��x�0z�nO!xMl�`O���/��O���߾����,e�0�Go~�?����2J�8���]`0K�f*�/�GXʷ����Q�\Z�5���Ik21���R䤆�ċ�}�:���(YN�s�����`�J��X�{@I4I\}AK����E��r��Ԁ�T�O  ��7��n�xe=1f�^��|�����T��s(ɐ�xy�����'��h�^��-� �������s?�WՖ@!Hch/d��&�Q&��q�'�Z��Pf��PR+`y��o�f���D�<����䆂���ap��&��&�.�i���z���VӪg����V�Dx$����O�8�Kc�� ���+��A)ڣ(�պ�l���r��2�;� n-.S5Cٛ�(' +�3ʢ���(��L���ac���;�=V�l��/}e��Ms5�� L�k*I��Q��З�q=�
O�B�l�k�bzxj:��Qd���)�T��7[�dU#3/�ց=6���`K�
��@�����W*�xuǔ�/��n�6J;��cOPʙ�O���l��Џ�2�*�m*��В��:��w �W��
?�c �m��^�'u��Z��(�YLx����O1ٹ��_zĂIA\[�t���x4R�n�CN�H�P���g�������er���\.O�2�F��MӉ�*�k9ҧֈ*�{�ew������������; �w���2!�j�:�J¼*�j ���qX����?l������>�cc7J�Q
�@�l%��R� ��j~�VF�߼���	��I���[�m�����כ_�e�$�k|�`��x������_k�Ճ�W>w�����%}���4��o}������� ��%z` 3����w�r�:9�� [!�+��ڝ�2��(��)�t����f^<��fTMuU��=�����f9.9�"ł`�tsz#�cC;-��T%j�v��gQ��ޙ�t �D��+�Z���d<��'(�sO��Pر���u�ԩ�ۭ  d���W�R9vuz��*R�m}��Db�Gց�N����� JD���rЄd?d��r#D�Գ�jv��'c7i��  +d�yU��d�'
,^����>�����|;�[��)�}��t�]����/���οk���_��ч�>�X(�P�Ƣ*����� E�*C3�� \��_(d��~��h�:ڭsl`k��OZ�r.Z�̧��}����P%@+���,��P��x �56*��"��y tJ�&D��#+4
ij|&t����XD)^�WH��ܢW��7�[<�e����7�+�RU�L�XrG�v�����u �u��t���;X%�y�B4�xuP���:;�$��T0<�IwMN1!D"�'6�!3�66�vun�]��vW��im>���|���|��+�:��^�!@+������v{�'� ��� z� Ȟ���������g����uʷ�Q��wMM%�I�	9�'���>hҨ�����&��^�>)���%j��|GڕrGۓ0F(�{)�0����b;ܱ�݅��0$��篐���ä8��i�_� �>m�!H�w۝���
Ż�������w����`o�Ӯ��BE��|&��3M��S��;};��T5
�A��e@���ؓCIU&�	��ir��b@\��./_���0�a��$�z/�����߮�_���������׷�����ߴG?+�Vbޘ.Y!	=VXb	���~�m��	.u�p����k��Aa�
p����R@�fce���|6>s�����3�.�j 2 �T��d*�`P�  ���V�!�=���A1��vg`�� ��O��=��]��:�t�4�DV@�S�>Sp{�a)dZׄ��}���
��m @(������u���̓5��?s7���́�O�_p:�js���O��?sİ7JCQ_�1��{	B?�����զ�M~����i~u�_z�=��M^�_���3RyGG/U	�t�4أW�����`�Z3p��8)�ّ! ��@�q<B>�U�Z�T�'>�g �^=��T',���u` }�L/��Lyn��0��<�:���\��� ������?�����`7���b
��wh�Dk*&� �c>-�ڀ�{�Aq�GC������OyCg�@ɸp��+�5Μ<��f��K f]J��HmʹC������e���' 7}�W��Ry�=d���d���z�H�#�5� X�?���*���2d_qL7�EclI�Xg��g*�r�ua��u'���P�6�fA>=a! �7�^�3�7R�
jz��֡��0rF�~����k���nX�-� ����L-[�&$hb]U�1��#� ���҄��nЉ��� �x@\qc
��� �Wh���ֈ-B��!n�������������_�&�y)yzl|�o�"nK'|��`�=o��{�.�wJoW0 J�r3�Rj�Zߊ_h�_�N2�ur��� �q��&�+JwN�L�X����P�'U\�Q�8��W�ZlD��QJ�Y/����pҝP���t�T�����J��4o��/��o�������s'�C�C�n�:�S/�]��d�HPi)�C��u�83{]M�  ����'# �� �������� N�zۥ�Orc�K��7������x�cw������ڿ���߾���x���~ ��J�.*t[��񟪱"n�@o_�/��3���������g���{�(F!2���-!:5X:�=�5%���- ؝8�xxM=e�'w>�W�@el�2&T��j2fa�R�2X�Vjڌ+���.�}f��T��WW�t��Fe��Fe�B����F:4��2y9:u+WL ��NݲH5{.�MYJ�0u�hj�W���:h��#�|��R�ɘ�c�#�J% J�P�2����Vg�ۃΗǔ��bW�^�1:����,��qhj��}賯 �8�P=�6:lk���b49w�]e
�z�����D��(@��������������f��OCD}�|��e Eܡ���n���T�Z�Ǫ��\�;��é�������+���	�Y
��N���=������5�ɝO� ���pA���0?��R� s�{���Y8l���F8�n�<4ۻ
��k���-7��A�:0/ K¤��h*� ���  U+O�p�X_�B4��h��Φs�_��J3��A���4�	�N�=�����p�-gȇ�?�ǝ���-� �/f�|�G��|�c�醓
ɜ[������-���@/س������=a&�,`�k]��F~1��{A�`���w����������.���)��n�ͭ�� X�����VWjxjW (�!\�?��`]H�w�)i eܖ��/�;^6�b��J������0 �.��`��`鍭^��5�\���7��K��jA"��{f3� ��l٨��7>�捥/���웪��zP|<��;�8��P�w�g���٠
 @s��P�~��Dc���:�Ew_S1Q��	  ,��Z�����Φ���TR׌f�d�i<97xC��� Dp�ߠ}aq���� ί�:�ۄ4_�pK�	ȉ�-���t �	Òp�=���l�Q'+��jro�zG�������>�?�eG��pK�vv-�����j���@�x|���EdWu����&��� ����ߟ���'�����:PuJ��&3�K�]%��y�	�GJ�z_�5p� Č �2����  �5B��\��R���a�v� *=�I_�.�%I�x��R%��|n�#9�J�j���F)4J�T��J ���<�~0�R� ����I��f�L�lU��ש�{��P5�W��\h�\2���Φ�7�a]P봋��`2�΅ �UC�� ����y�"B��p�Id�P����m�s� P*��:���eϲ��Do�,�&��A⇔ �Vb���u1�G]�pԑ^.(trD�����]a͛�;�����m�=�]�Y��KT0����v��@��Pk�Z��+�z��� �L��[gw���ݬ�"f!*56QԂ���Sj (q�3�����~g�X��	 X`�rW�����c�,x��d�ٍ�G�+@���b�F��[�5F�=�xYg��d���������N[yV0x#������/�7Jc���= h%_f�8_�����c'~ �-�h� @^�S ��_[�#��CP	���M	 �7������ݳR��7�� ���KF�h��v��h�4�Nʭ2���ۓl�G�.in��~<I"�<�����L|�=�%Oy�_����g�O�/�Iϖ7Iﻇ�t(Z�"�,��52:�W�h}�.jj%���X@֚��y7�@�&7�Rjtt����rF�&3K�eE-'�"�H n��EnS����<=��ęX$�x�]adD�Ji����B��y��(P�R/�P��0��OU�wZ���q�i��W��!v��~�������w�I����������  ^���?�{>�t
 �;�j2*���K5J5�])�~팏O��y  o��� �hA�|(
w?� ���$�c ��px��T�����~Z
��Q�0 h�	HP�瑜ʲ;�epfl]���X�&|_�m�����p�0���3|`t�#[�0���sS|�](.vi T��y����g�~�%�[�Wϸ!�`���� �����j�ӗ&d�j J����ݼ2^�2a��r�@r=e-�����X���
k����r��[PMfb �6�a��PfaCLgxޫ ��D�Uفk�ВG� �t ��w����ϓ��p��ḅ, �2�׿������8M��g�3P̬��>�� ���΁�\��]@�p�����-��?�}z��~>*��_��Tm�A��؁�7M������� ��'��͓F���%o��p6D��t����
 ���1�� �J%���B�'ӵ�����fl�Ye�=H�]ʣЇ<��\�N�� ,��*`���$Еߢ+�cֿy�T�s�5�A�i��pO�{�%��r�2�bM��D0�&#�z]3%j�#{��jI��n1�@ax�K��R�l��`a���-y�&= �n$��t�bC �[ݵ�wA<�EW�U�v���_]njj�p1���]���z���Dm�4p7�w�u2�+����y�^{�g��������_y�����������S�Ǐ[\��V)b R�- ��_� ���0 �������V�;��c�A�w�;��. ��q���QEs�zM��<��%o�A'�\FԸ�}߸�Iw�~lH
 �i|)�ތ�H��~򷴏� L��qC������z���d������>�aN睽"�)@!�H:�ww� ��"�T�h�hʟ�z�h��9�Yt�	=ʚ��%w~K,5�8ھ�Gs'  ��,2 ��� @��l�G�n��z�� <������	�������6��BKn�x}���}�V\X�︙�U+�V,��KN[�?���x!k&f �B̴JM����-� �*ŶjG:���˿٫&�j����_�N ���5r�7�����S,�,��K޸"w��F����ߙ�$�
�����T9H�}.��@`|[�q�M�}Su^��������� &<�@���]�-Sa2�$n���*��BcRW~����H"�V�d��8�6��26���4�p��R�,7�n���=��<%�8>�`����Y�K���R��YG۷  ���7x;��~�Q� `���,G�}Ϝe`��MogjjD+�򡓝��˷�:� ��� D1ٳ��b��y�Xű[�
�f{��L�J��/yϳ��V���v|�ɟ�Y�D�4��a��s�;*D�Qi  D�zŷc%@>G��~Hם���^=��� �������f�]�>�Nb�YO�z� ��f�;�'��ڊ��Ƥ�KnЕߢ� ����L�@�N_*DI�TA�T��4,�9;����}����9n�;8���_�%������f -�+7��o��E!�� #d5�������M߾�Ʒ� ��85o�q����'����P �_�����?�_!R�����8���Ɏ��:�
��=o6c�& �$���΋0�^x��  %�f(���L1KI�~E�)b��YC�L�/D���sE�L��j�I��<���q����끽'�p����rb����(��{�C���pxq5�Pn���w��^�?���'�f�N"�|�����o $�C
�����Xa���ued6|�+Xrj�^{�-n-�n��[�<KsxR�K�Ƽ_�,^����>�����|�!�m�^�JE"���&.5Ӓ-��VO�8u�*zD+�W���Ă�����ldՄ���'�Ϸ�c� Q�?|��'z�^�b�D ?:�1 �l�x��� �^PՁS��;_�w�Rq��Q��3�� �[����Pt��%}]������R~����9�y���n��(	�";�2�h� T`f"��� n�qG�Q�+v3�7���F9����rW�DRb��W�M�Pa73�l���D�Q}��
��B��� �/|���ΊFO:|�ctB����������AUr5�4tW��0ǽћ���[c�\�I��X_Y� ����X Ս+����)��wju<������M��Y<���M�  �@���#��Ӽ�V����c_p?j�����?J^�A�l��pq6�����U��[�>z���@6>v�ij�;���̎���@>ٓ��h��B($-��K2Ť����a)�?t��ځ��k���{�nx��_�a_�a ��|c�����= �6;z�~Ll����;r�OC��J{T�eӧ�bȉ�����<
�n�:4���L��4��?:0�>֊��>P��d-L9�8��I(�+�
&n�#*��̮^�bk��j�NvQ{�u���/�10| f�;kb�ǙvJC�]��2�*�w�

JtJ���m�&i��T�!��$ڀ�Ö��Ɏ�\/��/ \ٝV;[o��������N��Q�V���b��o�Ht�X�s�9�A/��z"�: D����w���^x�Cr *d�H-B��� 1Kd�ז4PY9�#���"��A��՟w]�%��)�~3{7+�9Q)3��������������|����{O���@5�tN��ߎRU��|%I���<��Ǥ}�`�R{G�1������8|�\��v�\�[�z}j�,�7� ����`}���V �%>�M�xݶ�3ˇ��`�m�1P�^���N�	� �Lt���-�� ���kP $h yj�tV[�j ����H0���}������
T���/�q�w�U־U��4�
��B��J(Lsp_N�>��KP{ qk����:��5a��z������F4��f�r��?eY�T�j*l�  v�bg�e{��J�98��OT�U]�J��u���?w���o~���������߯�_�~�ۗN���P�� }	r� �\��"�$��K�U��eb��|qm鞟�})��3[z*�[k??bp5#ӎ LM�4�)�B������/o�ط>w�'�� ��ߎX��F3y�$ K�m��6eS J*��$��X*��{Кj��m������	h$)��n{�K�� *9��R�ܽ�ت�Z�Or��ϻ0����lollU/n�5�:���t����w ���||v6N@u�v��\�#,�QAa�	f�@���']D��.�q��{�s���?��u�>{jp6�j%���
�yʍ���oU��5��+�2�(�!�^~)���1�l�@��;ɍ8���՟���� �f�ggd�NU�{d8��ȑ��D�*�:�����'�is����W �ο��������ܡ�Up�ҭ��Z�d��k]���b�� ��.�v ��"����5�+t�
Y@-��Ր���
� �H2 Kf���ֿ�	�;�B ��j�����/�Z |�t� ���%������T?� X혬vL44;�_�b� �￵��ʓ _�rzaM���h��K������Q�jӥ�E�v���I��������D1��8����m/�d��e=�ş��ܗ�6����g����W6kcq���#�/�5 )p>@�1����hG4��z��
�|"f�bs?�٘O�&���\ޥ:�R���i�'Q��ȫ	yA �^�jd�٫��d�\�js�_Pd����G=�<\[@��$o�	-�l��!��ǿx����M~ ���;پ��W="�[!��� �F�$���B��>�������V��ݐ@E�����ɂ�V���u�bF��K��ի����t0���Y/y��ZS�h����P>��Σn:ql�- ����e�X�@(W,�p��1} P�E@�#f�F	��J�� k�tMnQd��>�te��o��[��_��\�y�>��P vNl�t����`]������Ji[�� �(Ǭ+$�)$fLq�k�ٮR�h+7��h�s�>ŝr�J�S�D���p^��o����I-8 de @	i���U-�W�B�$�� �&�Pq�� u�/Uv�Vֳ=��KU�<���|�7w��2y�D
oC���w�/ �{��,�;JLZ �E��f�O�
����[� he��V��f��RȀP#?�"��� �mI2��j���&�b� B�K?�'�7�gz��5��w��A.ҪW,����S+��%�92A�j>v,G��w��vU�vU��  Q�s4��)���l��� �7�.���g��n{) jC�Z��8 �js{߁KSPrgMX�{��0t�bu�l��_��q,�2�R嘇 �x<���]W!o�n 
��L$\ �i=0��\'�� ��F\����vdZ� L�W�����-遲�����{������y������E���=v��;��<|����Ư�P�9����
dX(]_j+5C&�tqwy� �-�{��dbfQ��j�'_���Γ�����}�=��am23�"Z�t��wNX��׌M�|���V>�3-�~|�h�b�W,�z��j�$?����YK�Q�  P�~!�{=A�^u��\����h�h�~�  � ��=�/���)m\Us�\�� �]/ ����88�4����*L�D�y��VB�wJɻr�*Dڐȉ8�&� �����a�@�k �����aiH4 �e^�ط |�����0 � �8mƱ/���{v��c� O���v�������n��Y�b���_` _l+B ͐�pu@���(�B�	xI��Q�� ��|�@hc���D�*1f X�<�0
�#�o�����; wV;&B!I��)�/6Kz�������< JQ�|���e���'JLk�ttc�����:V􌁷�� tt�1=��R�\�"����P�-ǉ�D�Y�/��"�v#�����s;�D��kI�U��E T�P��E�
D�R$�G�W�L��!يڪ(���~��Z,5�D������p�w������%�'^;)xϏ� 
	^���sxvy�('YE�G�n�ퟋk���im��w!	^� /Iεg����$Q�����ڻ�����o%���|�����W,��`��K��B�	hy?�!ع�>�����"��5 ���+���� xdpht	��������3w�����%�lk���hPx��@�����P��p��`�o���h��V0�3��d�5JrIk�:x��B���9�	���>����Gl�����
T�l;��l��r+7�����!�#�Q���^�� h��M�Z���,����7���_������ă���@	Dp���خ^��[�x�-0	@m����9���n�ڷUe��ˋ���[�CX\=�&���|;aK��� RP-� ���@ʍ	�v �rIqZ� ;������5~X������)(��f뎙�}7��vӇ ������K��y t�d0f�2J� X;��ͦ۲�t  ���w�*)*�1�C��,�r�G��R��̈����z,9#g�wq+���o�!��`�D䌣 $zT�U ,�=c�ɾ���n'����}o����� ����<tN���d�*�n����'��O��^����ă����/	���+���ȁ����>M��a��N�.��K�|ڹ�>���\������[��[=��;���ZX�N���c��-_�V���nb��o�%��.��U���ܲ}p��=� �� T ��]R	��`nx牉��+��QA	��ᇍ՞櫇��)��@sZ�@�4q��ܨ:�\ @:�&fRc:p����=�bN{|��'�& �{�P���S//<�X�C�> jT0�-�;�ќ�>o�>��& �Z ;.�Q+y6Ϯ�9s�o���12o���ڲ�~Kߞ�!X���>�'�/�m~�g~��s�k����7�e�I1�Gv��-VrIyV@|hz�Mo���tt�w.�\�:t�:(}�;��?G�t���S+��J��bO�%��=N� (�[(퐾E ���./-�	�����ߟLk��ٗ�<����qz���4�1��<���q��mD8
��9����^M�C�����>����SB�� ����<U�0Sn
+�_�B��������\��@���p%�/h�?�*�;�G�m�z|	sP�q*X��3����R�� u	A�sw~����{����w��L� I�m�!�66=�������'���E�P!]��P6 �ă���N�f7т �EX!�5)u�w��(}���k��Z����A]�9���}c��''S����@�R��w�?{鲋  ��i���/�W���;�Y8	�k��ۛU�:�r P����a1ԅg��u	� u�P��;�jbo��6����yC��r�೸�Ђ� B�H���a��v��6�las/<�y��2��x�8����#R+=�8�����K�W�6�;\	�h���u���pݕ�E��� P���
��ض
Kq��~  W+��W��?y!�$m�Z�r�����8Z9�BG|�c����f�b>�V��6{4�(�4=����Cc�1��U�x(D�]�(@	�ۆ��ٷ���9��6�_�������u �˗@._�>��/��A��w���'X�'5`��<���p��@�3Ν� ���'� �k�a�h�z���R�Q�1�\la��. ��Em�"��>����UDyx��j���U*�@PU��2PA�I���X

�s������������~�3?�]d*�	
�$�0��K	�O3DBP
���� �}�	���.~��4�iO��e�>�� �� )(����yK�V-VA Cn#��Xk��*�������s�BC������L�1qL��'�n r���5㦅5��55��ЏTu�����&�\
�=c���ꛗ�>|��0!Ƭ+$kv hw��ڝ������Z'��3���۠HK|�r2���V�GD��B��z�Si{�"5ݪ���S��.<�{���7�r��E�S�^�b0PA^��X	b=�{���E��x���k�[�
b%C��!�a�] .OkQ���N�O�G_y�_&TN�Go�O"�7I�FON �]� ¶�x+,T���\/� �#� �ŏ�^�dŶ$S8��[ /�ex���lk�S����ѹ}qn_B7�K���nU���B��50X]�ͳ�N�o�g��sREN��=���u��߆Ɍ��� ׉{'W��,�z�(�̠����럚�� *���x��qgc���`�)�R����Y.Fb�Bl�4��'��=5����>D�ة��-EH��f�.
`+>�QH�0�(�j�vJ�)��T���]�"�[,�����߿��r�/{�zڙ�#�P����y��d��o�m�������#�℃�O�p�c\� �sI
�^wR��] (�o����ԛٱ����L.ݳ���������X� �'���y��T�ݾ�i�L�ϾƭP������3e�ĺq.E�j楜�(A����5ˑ!d�K�js�V���Q L��@ڣ��G?R����~!U"=� 8��W3F!�����<�G_��.�N���x��k���⻄��,��@Vۡ#�o�5�V/9���1���;���b�������d�����LW+��=�r�c\�X���ڷT'������5 ���q �P�+rR�[��C�K��1S�|w���=�{S�_]�诮���ڛM��t_�VP�fBP����d�:�Y�D��* xI�/��4M5t��_���rK�̎�ƪFk���Qη!=�z���Il��^�5_��_�Z����� ~i�=���7�sCA�%�1c�þn
��'�K��F@N<x��Ǽ��1� ��DəL|���sҳU��
pzn_~ h�P���Y3d@�S .��g��v)R��S���
���������  ||qxp�+(`ݺ]w�r%��/Z�ʳ��;��������y��W-'���

c ��Cn:9bQ�x~����΋܍۔����/E�G�pgKAJ0��Ɠg^s�����~�� �5����	�
�x;��&���?	�^����x����Npu�� r��Ş (��L|+�� u�W-������G�U�g�V���� �n�����]ʑKC��{�~B�'W��kC�p:T�dO ���  |�  ��ؿ���zUP/�;�a��) �NX������a�l�����S�\6]0�	=@Vԍ  x�ۿ����;-�Ci/p�ۤ�ՈCM<qђol�ɡ�h -��,|� ��խ��/�����΅t��t�c����!_�zd�484��>t�6���g�g��u��s]0��+n�(�p�N�P�-:����*�0�D?Ǣ� S��o�2d�M�j����}ǫq ��zD�k� �2�7���	K�]�,�4a�_���2����E��i��埶~����C�z��f�]��-�?S��=?���zm�L6��yj/ �j+ ��_8�b�c��y,�?��W ��<Xz���g����z,Wmnר�wŶ���T�}o�~�z�;��W�<��n{�����+n d�	qR��#��@��
����
��M	U�����n��5`q돯}��v���B4��<� �{C�M��s���`
�>���֡���|  �O�YJ�h�ڙ��e_�I �E6�3�Վ�ԭ�$[u� �@��%QU��)��~e�bG��sK T����
M;�7`8��/�{��+'�m�)�.o����L^�G۝���|C��6C��+�Ĥ��Ŏ"99�� ���:) 0�Jv5�v�#� `2�d�ܫ�d�ew�s?�6_���w���U��/s�;W�={�����9F  ��Gj�3��(���]�|�"�2*�i��>�R�|�T�0�_�1�9� �ȷ�  �z�ɜA�/̏-┑��U	O���ȥ"�7�q�kc����U�?��D�uɥ�7'_���x�n�z� p�ĳ1�)�j��A����������Ay�w��?����۝FqgVܙ�������?@'�Y�� no�"T�`�4Hd8� ���N�r�@Ѳz���|�ם��" |e�������׽�wK�` �W\{T����3�0!ƻ$�|[(*_���:Շ+[��艷($p���{?����k9�@X�>�7�;��ز�'��� B��� �6 f�C����� @���y�ڶ��Z�+�T��4��o��X����Ͽ �����Ͱ�6Ǡ�ۛ���_|4��3�����r%C�N�f
�puoO|>Q 9�@��7j�,ܻUr�����>��0N��j�E] K��a<����7��Q�y��-4֋��t�"w�&���(�ă��� |��/'&^���o��Rf�A��U�g  ��e+�UBc�7�a�@��(K���'�� P��K�s�<��� x۴�qǎ�
F�v�y0b�$/Ӻ&�{�@Հ2PՍ+�lUuk�³GY�Z|Z
q���o���N�/���/Uy��틬	>�%�%<�G��2!��U��_�r�`�8�<L��BVE7M�-�X�8�ă��$A-B����\��n
HI�VY�������I�B�  ���\̋�֗��ii�y迁�ّ3
p���L?��b(�j	yI� t�.Q�NWp�xH(56�U}�`ї��1��_}�|˽ևd5�_b R�_? �l882��W=�?޷���|�ׁ���=�{��G�QJ��m�9�bL0��2}��{��8��e�O,�  FJ��¾ܑh8/}e�H��M6�H�k6��-  >��k]�{�(v^��  =��,�����bO�'{k�O��=sf�� Cʮ͵]�kW=���~,K�}{JV���=	 ?L^��t�}�ۄ�%N20A���SN+1�L
���a ̔Fg�s��k8�0�\x5a%��r�%��7����I��O|��n\���\�Wv��d��Q? @�����,ŗ~�̺��~��R�x�De �C�o���~�4���3�{`�"N,X}�RYk˄k_&FJB�[�ѷQ���^�!�~���/���Ka��s��;o���|���  �Q��ݎ�U���u������� �(��u��ꓧ�2�{i�>�-�M�#�
����J|�+mJԕb����:���j] ��P����H�D������ʤ�U��1~��|��^����[;��d���  �*q��8��?���Y�O�l��w�����?�hC-F�Q�R�%����#�ױ8o�%�*���Ui@��B ���΋z1���7�z������|g�m�c��H倧�)�VQ~����+C��\�O�d!u���wF<O���lRM��������.ah��Tb��v�1��zݣj��%�*�zDnRմ���=�ܟt���į}�[��oq������~
���;��J_m>��_�wک�t� �L${���Z ���t1�/�]@�X���_uI� �ȹ�5�ݔtB{�9��qh]t-ړ��PJP/N�K�w�Z[�2�O��n��r�nd��D{՛��0SX�S����5b?K�,+D��|�~��3�"���R�v}�TfQ�F
.j �"�A�.�
�s�~��Wj�%߅ �
��B��C/�d�s�;�:�p�H5�sȀ��d�#3Y!k9�'a^��D5�2���z���ҭh��f�ޛށ�I��S��0>u�K_�q�4���% Hؕ���CL�� Z�GI:�Zã׽u3���|����T_�m*#�U�c�ϗLtvP�Hj����%��`�RS-vRj���I9Ѐ�D�> ����{G����Z%v��4`[��V�ѭ����ݪ4��ʦ�͉i� Q� 5��_�6@ڒ��,v\K}������J��@b|>db&���)cMxgZ����#(������Q�y�P��髵Xk��|�G�+� �5k?)�䴓�of�@꒙�b��|��E�� $�?MRr�X��J�v�z��[-�a�Y�����ya`����D9�B��]�&�q,/��_�ܗ�}h�D�b+JJ�o^Y:���;֊�#Uݤ/=���|u,�r�����/������
 ��n��K�\c~��=%ɋ�޷�� MI+����p�BXT��z ��/]`��7<8���CW��V"�w�{��K��s��I�����.uš*�{�S�G�}U �8Q�N�D!���;�=�� �Z��$$� I�^���> ��z�r�3�{���  ����^���u��W��:'S�O0�'�-�c����'��Cq�{�ŉ^�k����GgQA<c��X傸A��D_K.�|�4YQf��fF�G�(ڱB��w��V���6�ez�����U�+E~�&�!��i �6H�Q}-Ex7����R�.�5��J�2� F��� )�Ԯ@!�!�h��շ�%��6Ex���8�o-��t� o%R�.���D"o���EQ̙��0�,�	"Z�p���)�iؼ����k��� ����gk$��BA<V�(�tM��+�3]�(E�j�D`E�5	 ��4��n�;*�鳽��g\e��bNv�`�f�)��5Gl�Ŧ���A�h@X����QX����<'�'�0owϬ�tͷ�B����>�#����O�x!�C_�d�7̸l���M��B}΁�cv/�K�D�v͚_hM�#�b�ZZ1-� `�ư6 �f6$� �y�P�{f#����|h�qG���M�p�R��n|�0��X�}OR�G� ���8��S,�n������g��ނ���7gt�C���_��Fn<��) ��z� (�RA�C��t/�}땏��\�j�����h��4 ��Qg�F����~�	 ^]�|�Ĉ�: �i��� �q��EF�����@�R�	9�8Ε���j':╻�Z�����"��� h|���ô4Ͷ��c�89�>�,^W�$w=�]�Ʀ�+�(u �d~`��_pܲ�׮��?�=+�<G�v��������5�β�.�.2v��ͦ�'�[��qF��o˔�MO\���xӽ��x�Cny𰇾�0�M@ �`��LB��?؏<3	k0ד���³�+��if���[�"�"2p�D�H4:M|o#E��޺���ն���w@]cY�:����"�QY�7�´'�% ��5�с8>�ryv�cR��������+�x�)f\�e`���zϺ�[f��0���	b$HA����d���I}��c[&���x5������1�\�.���}���+�\K�@���V�4�v+'*�O�+k�J��6R���Ytk��øA�,�G�t=Q#��8($�:M|��Dp�5db\&
�=.E�b:���ܕ#����3}��)�3����?L] ��������e¡E��C@R]���`�\~%��+�N�˳���� �`��|vR��gӆ�P��ϕk�~˶*�	��x��ke��kw-�:�B)u<�_�<}+���o�p/��1�]���ľ�n�/�'��cd�̴(�4J7 �m����Wو���m��p�^����Q��x�*Q�e�i�V����+���� �F�{v���c��ҁ= 8>�ZoRc ��4�.��|�Iaӂ�kW\s4lج�� <r��c}}ӥ;�؛3  ��6 �����e ��l���&��9�FR���<=8��u'|���f��y��e:�Z���t�(������y�[)�ӥ ��� L�.�����U�w����8q��x^���ASo8� ��Ā���-�{����C�S�;0�ةR7�i��:D}�eW��2p⁧�=�]}��2�6_��8�r-�'�]�k��ӽE���۵,ġL�z��\��h��0��K������4���s �@v�[�O1��;-
0*��'�?*�Ѭ���ј�G�P@x����7������֞�w�P�s�pV��L�qc,0�=�a�,0�_��3p��NDp�Ĺ;�[����^�o���x�g�g�'-�l��Z�I�9�Q��F�WN�0 �t���ҕ]�9�����S'�xm�P�F�����NC�m�����ۏ�(�߭4� P�mㇸ+��)��BI=T�8_���mk��2u`��V����
�Ɨ���8�������b���zV�}� =}�-RLd�?z��K�i]03Pt��Y������wCQ��g��m�W��˽M6����k�]�#��y ,���6���.�� Y <���/~Z�*j ��b�RϞ���[{��� ���lí�ek鐎�s�l0>����^x,bx�4k�����=���}`�·a L{���sT�Ƒ	 ����`f�c�!��Q'h#;��c����m���=�k@�-�ԍ��WG�(8�7t K �n4����  \w9��C���j=ƹ�����?�%��q�q8�;�]ǈӍ���'iA𱁭\�\F�8�wm�3~V��s  ���`��O���+�`��xv
�K:���7���o��@�4 �s�5�F��G���� p��/r�=�Ǡ��M�d�퇂����m��'aU�a*m���Lڐ�.Q��Ѵ�6m��ѭ+.),���k_������'@t.��f���ˁ�k7i�P��[=C*  `T�ѣN��($,,���w�Ox�I�9�Q 0J�=�_1xzb��'��}����.�j{��V�|˃_
!�_�|�s�Z��uN�8�u̕vqۡ�'/�6�1��Tl�pjGG�v|Y=.Z+���g_ �d�>����\5�*��&�Y<�@� �;�f���.��d�'8X q�hG����{;�_rS����MP!=���e}�Ru���6Zԑv��&�m�L{(�CK�;��~@HƏO� +G2 ���S�P1ѳgj�矶���DΌ��j5@�ɨ��Y������b���O�h��O���� �<�%�]q�j�	 Tc  �ˮ>a;�1Q�]CNN]A
j�Bw��lx| �,����aŊ!׳|&b�ݣGV6�k��gv?�xu�J n�zv�Z���Ϊ�5 �m@�5�xG�U��)XT-ʎsv�[�2�t��T�V�6y�峷�$i٥�8��#4����=���ns��
R,X�#o��;wd���(<�B����:�P
��y�)�Ff?<�0L"�U8������t�Dt�V�@9$ L�l=
�_��%  g��z�i�Y�1��UW������|N���u{��7y��7����)�݅8*�*Į���y�q�g"�Y�") �~�~����Tߓ�w�ME��t��#ow^��t�.\8�sћ��:�z0qW�C/?}�W�օϓ�񑁎8���1_���~��3��ʉ��x[�Ԫ:��
��j�X̦Z ��gk�;��ī.��r����##[,��!k)��i~=���3:wTy`�G!'�{�Q�۫�P�#5�G�ٍ�O�+Es� `z����T5�;ݭ�Qf־��P8��zK{{U>�jp�P��V;&0dT��
* % ���w�q���>(�{�����[��u�H�Ec�_�|�?�8�o˨�`ޥ����w��Pr�ӽ-9Bx��k6���8F�8�F "�:��>�u�ڴzo��`ݮE��?� �}��_�HS?3�=oA7H[~2X�u8��C�Ĺ����䢫SV�a/<���]7{��O�
'�+�au��������I,[�r���� ���'J��/�_ߖ������\�7m�4A�n}.�A#!���Շ�aJ8(��CmhO  '��o呧�|udэ�[���	 `:Rk��پ�2i	<>����[���˻5���@�
-lel1�]���]� �����'�X˞���Ov�b�6RʨeJBB(�oV�:8��t�A@��-��  &^��3|�@�7���R���*��K�V��k �s�P7�}�a��A*>3�$4�>�1@}:�rn�vճ���o�
�T{���k�����3K�< ���Wj�C �@P�ٻm%p�\mtj�y��_S���U��7�# l��}�*�,4�p�S���.X�?]v�����#��\[/��F����ɨ��L ���, ��k7���E������>?۷��zl�L�LH ��I)7�*�8���A�C�@ �W`Q�86l�*���<�������G�j�xH�-��vBN���	��z�L��K+!������v��w��ᬠ8+�<�*I}z��L�R;�@�g섯�Pn��|j����`���H���>���c[/�8�q]a$���I�n�@o P���M�؂j`k�,��Y���H��M;��K�z�$h���ƒ��rA�M�[o��|�[�ϧcQƱ�t �k�5KG�c0��41"��Z����[f��W�n�yu������!�GRd���[>� K�[^ TP�YxA�m�i���C|@x��;�R�УB�yPb* ������
�Ta5i"�!e��p�(N�Ow�g�N^�sf9��R+����n�bG��l�q��T�w�����gE�}����r���*C���}HOY�S�e�/|��.�dX�Z  V�Z ���#,O��w���t�Vn���j6�S���Z�ƽ?)�L��?�~�'N% I�"�_#�t7�z.�W@d�v- ���*^�a^;�3S����>5�h�t�H�3����/ �O}q�����z�h{�b��/�|��=�&ĘPYYr�I-�F�<�t����;$�~����B
>��w*��%$�;��?��u�;��O�T�C��r1*��皢K ����{n�UT�n��a��k�<D R�}��Ѱ�l��
!�阄��AD��!Z�Ukv?z����qt��2���8������F�]�#�'��.�`n_H]�g�g�gq�
�)+;`��Ҏ�X����oԸ�y�|�[��*!�LA�G��C�'p��T�Yw���~ �1 ���n��8A ��B  �2�Z��kËN��k��5�x�	��v�kr���'*KN��? ��WݫV
c�Q��
��KN ,*�^T��m=�4��ˏ����d��m����Ͳ\y�) 4��cH�[��h��ZWG�e ��Z��V�� ݅�ew! ��|�ȡ��w�CL/1��~ܵ��q��ѷ;��n� ���t3Lлd(n|��O Y���29��ߙ�ZNK��cĨv%��ZC���g#P���t'�8����G���=�ݬ���J���,C\�����/<��j�����~Ê���-�E
�D�ܷ�ng#���U[��j�Q'�\ ��<Z�  3���Y�Y >2����w5j͠ȉ\N�}�q�?���.�`�����`3�Ki�4n��^Y
�ÚwZ�Q�}�f�t?�����H�@w�X:czh�Є�+�<s�4�5�;k6 ���w}N�pCm :�t�	*���M�UY�|t�� $ł )8--t
�o}���+F��P^��[b?� �F+���n.����Y�Ät��mp��������x��?u�G��!
ͬ�E+�a�ӻ���nz�N����k䛁@�-�	�4���G��&18�(��������/�S�wg�:'��OP_�ff�t�	Mp���TYg@5��N��q\ `�/�rH* ���  �C�CN�z�i��j�s�8�(���ȈT#�,z�a�&�|Y�С%-�?q*n�Ն{���{�s��[	���"��"#�Y#J8�~� ��v��њ��w	�I�8��~�����<����3�)���wtv?NY h}�֥Y����&	=��!�Ӯl��%���̓� � �J� >T���є���/�68��N������o؟ �x�=p�W~�@�z)���� `UAv�����1W�\8w�}�_y�Ǖ��R��R���qQ�����55?z�M�h������^y� @���H:���pI�^\�Co�����/\��P �<���U�興�rgghᦩ�µ=�+�x#NU�QH�}�sx���f�O�|��|@n�-���� ��9���Ι叵m�}�!gX�a8wЮ��ܰ���ϕ�է�\P�����M;���JA[P���MV,�VuZ � ,�I�V��h��S�����J�o��:k`��ox�m�}���C��~Fw3 �U����Y*�~�΅so~�Ч�|L����S\��@�S��c%"� �\L8�n��P%� ���F���Ŭk ���V�����dLb!|�&q�HS��U�X�����f痌�m}l[��@H�Tq՞EgE�rr�~w����&ڭ^�-[��֣����- 8 ���{噂5`v̟p���^�B8ߨ#y���)7H�r3�aN ��a����VO�*v�T��ϕ�Әb�8���O����>?�������;��}Z�{9�0C�WoHC�GK��ϚK~�p��f� JB��U��FC�J��x����gNذ�z��o��������b#���ï�|[=�ě�:�ĮoI��F$E��'�r�/ ����8�S 痌�Ώ&��\��  ���M�?&z������B�]T�?]>���S``� �G���Z G� � ��7�D�=p˭���! #L2C�<@O`�w�wc��1����*
X.�������i>w�y5/�.Z��������7 ��N��ȓ|mr�	V�<��1 ��� ���_��ׇ�>x%�+R�|ok�l����}I���-ƌCu��.��.@���;��X?���=l�N���~���J,>�ަ�p�wg��Q����S�����@�_Et	���!�AJ�(�������� �9���&��P��� �XX�C�4X\���`u���j�4d�C� 0��A�W`8����&	� .E9��=���ǆ�.�	�Ix!��Z��$� �#s�|���� ���E l�%��Y�Ro�شv�W E� G�������
�>7�� ����ۓ�\Y#M�5J����j��8�Pi���L7�w·�d�ρ��I ��xg·���T%��ڡB��!XA��a���˟u�r��؅�*����jS# �i  ,?�z��<�imA�;�5xx�a�T O�<1|0~kP�����@_c~�Iªr��~K���E���Dݑ�^H��0z�qs2T�֏e��}l��r�#�	�8��̂� �L�"ʻ������%<�ɟi���ڥ�k; �9w��%����������,j�+�f M~w�hvO"�d�V���p�H�f�P��@��i~��ώb��pB/'
�īȇPFRC�o~�� 7\ ?��r�� ���up̕/m�  ��ǦBGO���\�H�ɿz���\n�_�0t�H�kO84�ͳab���O7 �bz�D_WX:�f��Q�Q�&MΔ���nJ��%��#����?_ ���?�����m����#?���a�r���[�M�I�O����6ڂ��ɯ;w��(?��eSx/!�x�'� '�k)r��v�Nob��3���,���1��3���Bڑ㵱8^�1`���#�h�p Hsu��QJD?h,�9 1M,��օ�-�h�p&ˀ"��b�%p�;���qO��⼢ �pn��p��K���-)�r�oo:K٩�'ۯ��qb�?�� ��&����b  ����R��X8y��/��k?ƙMO  �%{.L;����W�V�	 �/�ePơhLH�!c�V���߻�3|�_|�Ԯ�w�g��}���Z��@��!^��ޗ������I�z�{7���[f6���"����#E(�$��%����~�Ⱦ��1|B�!n�w�����R,�ԍ@��!�%8�E����P��w��6kX�;  p9�~��%��,��۶ϕ� ���~H��k���O_P��H�YE38��~����
�|ud�	W�|�o U�)��Bk~s �<�}}x��G�|5��s2�m�b��j /FT�@�h�ڙ7���kMx�1�����t�k/oXvy� T�B��*�.��Y��X7;)K�B�Y,)�XY�7u� +1��E
�%#;,��P�����a��%��
 ��J 8�8iA���6��K��K��wa�5* ��	̅������{�|O��2�7n!��7	>�V�kgM>W.������9��VdVF3����?�3g��p�O*�"�F�-N�2���Y5���n4�?�(%�!;����K����u�m�v=���ϊKA�,H����=C��r���X��2r���?���t�	�#�����g�.��־ʂ��M2�+�mX��ܖA��L�
q��Bύ/�Z{n�"��:a�h"�
e1FJN^  ���I��{Cy�`�h�ɍ���6�~˾㦼�5��%���  ���7�/�G�|$V��,�AD(�gi!j����]=�� HMCB�t3#ȇ����5��r ����uA�~D���bN�.�H�2�c\^xY���Ȏ_�{fQ�H  ��r����+��7����f�X��G��?��)�J�  p��S@o2��ig�{Ȓ0�����n
-��s�aN~�|�׸K���0�þP!�� �L\�!J�3��K3� �m|�W����*��'~�9�s[�$ru2��"�k���⏿����������s[�,��� �&z1L(+�u��҉a,����6u`Q��
����"q������}�M��oyiLs�(�}r�-��.���{
 "w��i��&�6%�Zk,���&5��D̃�E�*�W���^�/ţ��\;��\sn.�&�j��Pc�y�f�$Pk��n�)�q�e�H�	k���uo�|�G�
�X��E�-3�_|ѣ�� C��s%n �����~SXT���MG�"��7���0�����0��{�  �f��夋� �f� ��/�5`?sD�[�#��ئ(��=�����`�  �D�C��g�W?� s��"��ǿ�Pw����%HqK�&�q6�ۃ�[C�R�ǯ��Z��xZM�wz ��T_�-/�Y^ߖ�o�>m�� ݜ�����|l?�����p�6z�pF�9jx���y\풲:�p�p`���"�*�!|�[>o�bVcZ�]U+a.fU� �+��o�����=���pa�=����x���B$@Rcn�3��A�EO_� c ��3��@z"�q�ؐ��;�o�d_:`����s
�;����̙0���]�:������w\?��ZBn5���oy�&/v�HF� �Tv�̛����� Y�-�z��/�k,ӻ.��gWG��8�X�ǫ��ٵo�n���Τ����/�o�0�LF���}͝u��F��Tb�Gڿ欷zOi�n�F7g �����i�D�P����`K��9\�. �u5��(f5�-���h�z�v ~� ���i'ӿ���8=��<�������$���e!38� �Gk�U����5�?8�?�n_� L��<x�|�:���[�'���֙Ř�w����]'=jǎC�~G^<�c����	�% ���zx�^�������K `�l1�d   
kQ=�w�a�䠱�57N�W��]�L2�h��̅��r��$u��Ԓd���^x�T�
�W!�<-���qxfU��N��<�c�Ǔ��3��Fnqj� ��#�Q�#����X&�1S-3� ���E+��<�}�����Jj�O���2�%9<�W������E �vN��L�� K�vv���3�	����{��۲2����������_(���{�QX7X 0��� ���ɉ�ߞ�.�ĥu� �����kwX1A!�>�ަ��.TC��4<C�eiQ,��[A��`���,��=_���Q��?�6`�������W��d.N�fr�'����\���5x����Df���+��7T��&|�Z��B(� �����AG��z�b��Qf2�+�+e)$�c�������ʥ�僓&gNNV	�2��,���Ι����c h�#��� ��x��k);~�g@1H�b!Iܦ[k��sc��s�����@��w���%q���L�O7�ǃ�1�Qx����M����@���Mp���5 T�d5d��\�r��|����z��|�3mzk����h�d�Up0�~_��+~
  �^8��Ů�,y��]�?P��*�w�vrI���yS�cV[a��C����B�ܰ��彧|��8!N@�{�+�X�\����Z_혾�����Ss� ����L�׷���X#���!�7?z��׼-s����2�����k�t����Gm�[W;}�/#��jJf��[:;~���{�0���W@�+�}�3" �
�^<� P�҄�����)`�OpF?��V������. @mF>s* Y��Ol 8qqI��<>ךxJ`��=��C;\H���MT���g@�z5��g�$>1��s���O�)�5��CKN#y�}>�{��s�����Pu5X]Vׄ��G�|�ZO�����b�ق��l=�;?��yM����{��  ��7 N\\J�������6F�l~����m�l#� LM������[�/|`��Z�0�z�����~��/=��W~n���=�ĩgP~����z3-� ���[$b*L�} }��1
�̹�D3e��'�|`�Y�j�
ӿ�Ij����3���,] �d~�e�%�y;�%-UO��t?�JN\\�U蓾&�����*qb4#�Mи�񆣋T2���}q��j��|%�+ݨE��٘zr���K ���?�p���j�������V�ϵ�8F�N�@�����_-��˛�m���+~=�<�;�Vr$��S�P���X�m��0��(m��[�|�'�����i��N�}D���;�z';q~u� ņ(*8�@1��?O�^CiP�ič�t��w�j ������ݜ<4��%{�;�=ʈ��K;�o��&z���sd8�����Z�B��P/~��z$L(g]���X���d��[�����+��I�C����m��� �q,�Z��D�%̈́T���{: � ����&��#{[r�w.��K���?���Y��٘��1��.I�EfsOv̿w�T5J�V�j�ٹ���T��\��\�N�����#׀7�{m���߿�V�s�/F��x�_'���,R)���Z>��T�|�G  RI�~�������_i]TO��ƶ�(J@�Be�c����0��ýWŶ_%���F�L!~���^����+��d��ޫ>�}ӳ{.���o��WF���#���%����VR��eU�8kپ�����G現`�U�� ��iپ�e�)S���8�
5�H.!ӻ��ͣo�H%SB��E_\;���䎟{e��'�,$��׼`h�y���#RO����x ?؟}��9V�}]���b5Z���uͮ��5��/֕�MO���5��]�|q)Q�@o�;p˃��jKa-Ő� @��Y�o��,��e��zR�����v�^��t���b^Y|@���?;q���a !E���PWIf�*��7����j���
�8v�*ǖ�~<��2�ڢt�Gݹ�Q�NzT�6�x��1������[#ɵv��\ p�AH�d=ٖ$��oxr��O/��ߎ*��[,}�oU6�%�,��3?��y2�� �ګ����m�%��\l?|��+{<���9�@ P�8�#�r��]��w=߃������d�lGA#���f�����_\����ح�[�p�`�����G��y��o=|m������#��ӱ���w?q��K!�-t��
 PͯΏ�ⴄ�$����Ip�bp����?�^��������:=�$��v�����E'n��ʛ������F��'��8���_���]h�PIfc�m����oN�O<z�M��қ*=���t7g�h�-�l�'���H}�?�8p@U%��V�t���]����� �ٚ�`�Cp,�N�^�ο;SC\��\�.�H��  �JT�(ڱ�o�N������*+�v �}�S �j7J�h�%�:h��߭��n���	,!� p �����C�h��.S�x�
0��(B���^�kh�;�VL�9v��~��(��r��;��6gnj���o�X��6';���`|�go���������<��ss���OT�V���皗)���f����g�C��{�����ܢě���������t, ��; D�sũo�!�]��(*���%q4B���+�����o�<���}Rڨ$�  �_�aHoZOש�vP'��;x���Y��ٙ|}���;ЃO�C�5@Et��]�����  B�)nK��k%�U8���x�Ƴ�E����D���Hv���SD �ud�CЊ	D�Ͻ��SG`����e�[ �3؆� �p�p"�/ssÑb�5�2��[ o����q	��z������ l�K�d��L�I�����.P������"^�������9E���B�6��[?J��o��Һ��5?S�r���hYz
�
��}C���Hv�O0�J�����E�{K��)vR���b�S�_?GEB?�2W=��l[�n{�"��\��#%��q��MO�ņ������Vv_P�	 �
��uk�:���� b�Qr
j������~>�)Z�w��I��j9� 6աE�F��S%�#~���{2��{�&h\3u�7�ũ�bɘ�,R	�����x�-1>�-�۰�ع��} �@�� X�2������+=���X��VV���r ��r���A�{a/�{x�ɫo�ͼL��K��aJf�wF���>�A�	2!�	���{���Ca/��a
{!�
�{�x�%�MD*��#�M-e� Zy��O��.��տx�y �7�"�զ��첌��0�=(+��[-sT橦j�<�A%�K�X\-�����|i%�*i�N�ԥ����k�ؾg�a���5t�DO�w���X���<�o����x/&�{mY���������Wx_Y�u�Ǳ[	�������?���V��sO��ǿ�D�E M��s@�4{�@j�j"�'��#��8�</�7q���O �跿�����8W��9Cg��8W���9�Ŧx�0F���nEj���oJӫGto�h��6�)�G�F����(��22��Sȧ�������Z1ݟ`p�7#腪��2�'�B`O)�D�' �����l��W���uV�VN��B��'�30�)���J���o�4IzҞr>_������B5�`�X\j,�
*���J	 f�
��Hÿ���@#��J���7��
UpXU� �l�¤쭑�J����A!���¢"�� x�0 `P�I {�D��v�DT�� `@���'�!	�����u���X ^߅�{%��	�Y��~S{���3R9B�� ��1IP! tX)�Py�u(%J��
�
P)~�<�E���݁�`�{QA��
�E�$$����mF!�lA_)����V������=��f4���k ����&a*+h89B)��Z#�zŧ"��
@k�[ι���w��u%��R���ݴHg��(:��{%�4 l�#M��^�B����K�%%z)T���ZsITa ����K������+����[���M�KJ��)T\_ߴ撐�_42����R��a�����,��ٽ?l�O��s-?���}Vg�^x�ڢ�����,|�Z���|�w�{ �s  �* ��]��A[��~[�N������0��R<w}�i�d$6�w����e) ���� <���31�7L�k�]ϼ60{0��	����������\<q��c���o~�p<�n�6����������X�G��[�߃���D�w}쵂$w��F񾷾L��[^z�ïz\"ﻞy� ��K<L�f�?��_�Lv��.%v, ïl�L���?��o�ѴkǠ�o{I�l|��ۓ��> ^jإސ�S,���M��}M<#)͌��14|�f�7.������F��dA�˖-7_jh�9�k.~x�{�/?�*�
�/ @}�U�S�]�T�*+�*�j �/-�������4�i�>��n�"ԉ���Ƕl�2�޻
�X���t�?Cr�W�	X_��YӪu��۶i�O�r!�b�n&`բ-�]'MJɖo^J���u�( �7�}��=tD\:Î3����O�� ���P��:v���qƟ�{�ŀ!P�v��� ���%r�xM�!�_����������z��@!D1��Z�d�[W�z����=� ���,BHe��Y�}��x	��� ջp��,�kf8���|��JԍhEd'�Y����	(��0P�  ;E���0P�\�Q�=�]j��l*l�x�����uK�[J;�?C���rGaӶcl����#l��<С��Wsfvα K֍�ם'��� �g�#�ج\s�C����_�~��J��e�k����xna��_,�y�� ��u?:���6iJV�/�R�J�sը��Q��P l(��Q�qN*�Q��((�T(
 6�T�%N^��Q��� KK`M�vI�>�xx��0�sN d9̖� ��}N��nl�ڜk~�	hA �m��:�h#����-��_k]����|�[��# �4�yIl&J�{+'��0��� �K�_��~iHX3�-(�h��y����\)f(�ŉ/��j7.Ֆ�I؉^i;	0���� ��[��ETT�(D(�5N|q"���i�'��_�S�rH�I�_i�_�  .���QQԃ؂s������w�C�gJɋ�-�sͷ��6y�7Js# ��V%HG:���M��� �������ڱゝ릥���Y����Q-��`c����×/�,�捙ہ�� ��n��Ʌ%�0pN'(�?������/��E�?p���� ̎H��}�e������� �Q�\�e���%���#/^��R�NYՕt��T;�.�r��8����;j%2Kg��� <�g�C�M%�Zl*�p�l��}�<[9����GX)2M,��* X�/�O�@�W'�&$R�M����y����ʙ5+E>"��\E.�Z8��r�����8�¹w m����?[�qr��+D�07P�4߾b����`�m`c��PB��r�Υ�M��4
V-��8><	l^r )3;�X'�zLL�Ne3�~��LL.Y`T��ڂ)�|�*C�'!2�Ff#�O.��鱫�� Q���ۏ���u�=EUw6���Ͼ�� ����p"����.6��i ��&��gJ�%�f�͌����K���O?�Q��m=���WԄ�N�5D�\�[>q�,�y�/�ܰ~e'�8�ɞ�8r��_��r7�� �|���X�n����4�_�)���'QPG.-̯�jK3'��`6��ߎ�+�Btw��Ez�i� !� ��o��8fZy�@�%,�޾b�j̍ `���8E�`�uv��|��,H�H��b�ٖ-�ZCa��x��ճ+D&_���\����,@EX�8e��ԟٻ�b �h�r����{���O��&� �Ϊ�Ɲ7�\6�aѕG!ՙ6� ڂy�$n��VH����K�C��\���c�3 ع��B)�� +�I�߅�m��c}�S����^�
�,	��*�s �r�J�`��u��OZ�f��dn}��t��=�r�迤��T /�<��^^�Я %�͍%��]��5t��J�× \\��>{��>�UU���H�6�l�_�� �N\9�p�����,��{��׬ V
p�R%m�;�<�#5��6���U�����k��g/W`�|�7w���+E��s�UQ#J~;�"��i	�]A=�8�d�pr�|n�%+��|y��?[nI�% ���� >^]���¥�*�~h����'a~�q�w+�Ԁ��-�88�7��v0�b?lӱ}۶]'MJ8�<�
f�~[=>���'o��  ��l�����/� ��㦃`JR�/0C�>X���n�E%v��D��Kt���I �I�C�q��":���;�������E�
j 07�s���Р�b��Kt�IŒ�0t`����^��X
 n�Će�̑'3����K��D ��j��h�~(��Y�,���$�ނ2�Z�]�yF��_��Z;���q)���H_���	l�������\Y�UUs!�N�?y�v�cW;�|�G��O\��v �?|�֗W&g/W��(��`[.�׎��~��Vg�*��6.��q��+�Kf��$�BtE�ȫdy���Q��Z���A��_����z���k�^ �$�jg��q2� @�x�Bp|x�G�&�� ��hټ�BZ~kw��z�n��:�J-x���Y�l��-�{\޿E�R�"�� �"��ߑ~'�5��L��t������cw�����`��� �Q�+D��
�s9y�hdt   �*!�@������@����Ȁe;0MUQ�\j<�������Z�~W�c[2���������w���`�� w]9W��� ���?T}k^
Y6B�}�'B�%z�}{��bv �(�^����,���L�Y���P�}��JX�{�n�ƪvM�aC���'%��Iɠ*��:2��T?iA��yIt��$AP�>&Y^h���㑙�|�k��=8��TXY�ن�'��"�P���.l�������>���� >s�s�� ������p�;�s�>���pPq���ش��R%���jA�bM0/TI�LSG2nx��Q�.�1}L��-��ܺV:���,Ls���6G��bСR�:P?uA�	@�<mqL�/K��=ѿ �^���U���k�r���n�j!Q�obT-������������$^��W~�3����,��w�N��Ͽq�vxhy��k�/}vovcz���s_n ܌���c��w�@�B��V��+�j��E�.��/�^���J7� 7[�_y��W����lh�i�	��_Ԡ� U������򒘂0�̞9�OZ ����hyJ����$�2����37�r=��-/'s!Ne[�(4fB�t�]v9��]�ae��H�]45U�'��`6%z�����;��q������/�/���?�Z �r�CG��\��%:��3q�9fp��砨���Ҍ�>_  �֜�x��mN�Q��2^������������$���i�С{�_ V�Ȗ����X���6��<@^ ( �@ �@/!�0`[Az|qO��+��9�B�9 �k�Yr	<?��$LE � &�y����	��t��L�yoA�Z�]�(�b���Ύ��,v�AP�Y�P[�g��}g�������{/����L7�^/cm��V�_[,^yٍ�Њ0P��ٳ��p�ف]������(+�sԺ�G.-s���Ds+� i����,W�]�R���`x��D��i�c����|$� W�6 ��\��`���T	�%���ٙ8�����G��!�Y?ٷ AO>��Y  nZٵB�
 �X�* ڢj�\0�!��hJ��~�f�Վ���������Ik&d���'�:�q9 � pk{�al��j�: ���ۗ_?�����M&^���sLG�����{��eڈ��II`Fu �_�虎Hܕ���|�e�������K5�C1 � -���Y}p�ry����K�aE���Ѳ?�8@���������~"��$[�N/<����N��x��Ɇoz9���O��Vq�ͅh^Ƽ��GQ�*uW�W `�i� �(�_ՖfO�g����@cX/c�T���rfm~�F3��+��v\�����3�$�,YGK����$A�����WQl�TH��Q�9Qt��~���`�{���A�}�s�mer�T2¹L�ӿ��<�6��e ���d0���˥���iȺ����9~���j%pnD���ҾK/��1��ew_z�J3
 �P�&g� �(U��c���ۏ0�ٚ�9���n}��䕵��o��2�+o���ǒ �s��ݲ2_��6t`��΋�29g�~��@9 ����l��p��gL�?�ֵ��O+�fvFW�|;X>|�˃��np��qs�:�n�;'7��;��ѤS@�u���h�����Ɛ�R  t��PTTV�Px7*q��#��1�jK3 �N{ �(���˸)b'�|�Z�-w��� ��kV��Q=����p�=�]j�y�*�ؾ�rq��)�cf�^~�
��x���0ٷ@/�H��~�y@+]�V�X�*��z�~P�F�>�����ښ�sp�A�����������(B�+ikN��D��/IVw�w�˫>yh�UM�v8�J�t�5}���7��+h#���5�EA؞��+�mc�5�>��?[�rAU2)�{B�}U�!�*Z{r�ᷯJu�����B �b �s���&��_w'�|�g�����,٨�RUb-��蔵B~8���P7ϼ�N��%kW��3��\"�rӴ� B��ڹ�@AU��& H�v��g+ l���`b�. �b��l�Md����x�e{λ(�H=��9K�(];~� d�~�����]��-�[%���	�AZ�kݯ�je��Ic�\�Z�{Sϋ���U����s@6�+�a�W����n�� ����+��ք�P��Sق�� 
 R75��Y�,$Y�=���R�ٖ�3ux| ��T4syՅE�N��0`��+���(Ź�FB$�=,)����<o|�5@��*���4iB��u��` $���S���No~�����Ls^��1��;�=DaZx��@:\��� Pu���vFS-�o����,:�٩Ė ��,�����'*G$���""(z9��ZA$T�b��Ď�s�W_��9�م���ڿ��}���W�`�\NuD��}��kΚ��j5f)���Dǂ�tm˦���I��O\�@�� ^�~-p����{��d��$�NTɥ����4�iV����.�+��i��a��.;5�& @5
��W�)�]s�]p�����"�50��m_�k��SYY=�o;��>��K/�`*����q����]�����c�<U��L[τ��x��?����&�����	�З�"�9aޗ�K �  �u�@o D3� �t��AWz�>��W J�n���P&^��2�����j�a�/v�d|;����H^�����׿ˁl m"����}���~l�9�9-�rl��-���"rI4�j�D�0U�L�p И%�3��'|�ba�b�Ќ�����v|�szr�y�O�'���1��K�~�tҜ�=��� [>;���`��wAf����Iީ���W6'AJ@�\,�� �mg���Ĺ�c���p{N¼��s�X^�{�	����a���s����eQ-@>�J:�K�;�|�(=9p�EVǳe��9��}��]�u� �D�%&�t�|�6����(̌%y���^"�����l�g�w��,�����of����A3m6
��J ӭ/�D��I��nPPd���n��9� �;��Ҟvy�վ�0;	č�N�E�39 �����!���<���Q
����� �D���
��t}��n	 �r�Q�o�+� �O���K��?��y��� l��'���ա���93�A���2 �=���dcÐW���$��N��i�o/�~�  ������x�h>�j (.N��sJ���t�S)�ru%������u7���� � N�*q�=�%_ֲ�ؕ���.^Q�_�¬E$�L��GFfr������eY�I�Y#��XJL���x)���)��ˊ��\3��O���|u��c�}�r�tBT x����8t�f�k�
 ?7@���Zv6��B�:�WS�+Gm���2I�����|�� '�e�Q�J1�EU3
c�� 8��2*ѻ؄N�RE3"���2��V�6$��Y\7�k�ʙJW��r#��M���K- fF�)������������ ������x�hvb��@��O��8�zve>Y ���De~(j�B'%*Ts�P�� ��^T�-<�a����Q�*�ײ�8`r�kr�k�|җ�?�����cr��?|a�\��g�#�ͮG��)��q��s]s訕������ ��O������ c��!X�}cTά�&2`�Whg1��?�[p�fr��f0V�-[W���4�I�G  Q ,w����
�\�B���c��-sǼ��zEZ) �mo���O������̌���\F�=��[//��5t5�S[�wz�����բ
,\8;�ɞ]��-�����pX��Z���gs�+ z�Xy���RU
QQ��ՙO"�����
�V @Aa�(�5���`�r!P+��R[����`c��B�V9)^�'E%�r��z�O�_�mmm��b�� �򦀨�|,���2>��ĝS�����S�~sG.~�p·��  � �T�ɮ��ZS^��s lz��I(�@<ܘ���\z#��6�^ (-LE*ҟ�3>���� ���*p�xT��ʴ�w����w�� ��������]�s]`�|��˧'ojm��<��s���y�t��[.*�]�١����7z?eOG����Y�l��Ȝ$���"@P)��Rvc ��Jg��l����vz_,�c��VWg߉�,z�@�NE!�\�o����B H���; BKZ��۽�:͔z 
3����8�X.���5t5;��M���
�D��n���zgb����};	`���}��{n5�HW`~��>���\,\�.��pR!y�N*�q`Wq�����Yh���$Ѹ�5B���&f�G��X=��}0'a���Sa���r9Յ��i���GW��R�|���O�@�l�7������٘͌� ෣ה�˧o�(*Գ�Ӯi�QZ� %�����B1%������\��M�;��/Lu�����$ʽy��*V��*2*�蜙�qkyu����B��57@��l�~��ʖ7�O{�s����
�[�Jq,��0��E�����h�w�O���.��}mƀ?_o ���.����)A[�Kn�������lT����:������Նզ}�c���ל(�P3�0�yHƃ���0�@5 �=�&�U����,TW���dw�T]>�݆)l�WVV�7^1��[��Ӌ�5�$���<`}��|��کw�����,��=7�%dYZqc_;�`��k�z��g^h���<�g�ae)�� �����|1����ڹ��3kN*� ���V���s(�撾���������M �v.b�f(XXvU�B &ϛX<��`˦�+ �|� 3͵ ��b��M`��-���GXrև�,Ɗr��@FP������.3 �=�0�f˪�j*M���h�ͳP�����j��b�\�߶|�@ ��N����Qrצ���/���ew��} (�4ʎ|��\]�;7<�0[Cs}w���t�ҹ�מ�G�����r��Łq��H��I����]�� r�
���9�5C�`0 �rr�{�򔑛�Ȃ9L�k�h��f�4+�����9 � `<�pcna?ZT�gn��([��cI����T ���\,v�zǷB���q��G�kTK�9@q|4wf���w�L���Ő3� ڕ����sbk+��}��E g��I��?���d���OpȏZ ,����N�s�PZ��+�(�V �=��v�?uHh�w�Q ?M�O��� VYW�P,}v2���I�}Z��1���v�d�#�GX���������{��C `�\2_8�d>�X<�s���=�U�Bh���� POZ/]��^�_�NNOv��`��t_��w��t�` J=�%�w�!r{�M��\��
� @�����7P��f�1l3�{�t��-V�<]>WY+������=x�֯��H�k�����ZL?��;���tA����$�|�����J`���7g>�b��Ub! �r��#9X԰���Ol ���V�N/t!�y�ljN�:~bna?^TK��D���鹇�Ú��U�|Ok�#�2� @w5Ť�y�q"��y��i�S@n��ұ~o�|y�8{���`)���O_[��^�;	��~l�K����Bs�N'~��k�>���{\y%�$ffF�6$��Y&��,Q�Z� � pEq @�\�wɅ�QC$bhh���|ڈQ��ZQ'8��-� ���������{���v��,�K۪�߅�1�V�mB&Z	�e�jA�2�_��T�iL��¼�)Q��OC�!���ݙVeB8=A����1~�J��F_������x��`�J��U�p#߉A�YK���]
P�����RTuKtB	��?]�z&^���{�1�W1/w"�士��db��bc��dO��k=�p!�w�>:"lBb�G�U6��r'�V��C�Dƛu"�o��u�M�ZQ"�$.���Ip�Gg#�y��,/,����lS[
�-�d��:aW������tb����O�/#PV�O���_J�PP�au�䣵Sw|�U �z��2�u8�4�l*'��|����o5���ߨ  ��/%��d���b�������C'��/� ԪN�R}�[_���� z�f��Fêj'
�u�0]K������#
��~��L�\:Z#�]�a��� �W4e�|�@ *�|v$uN+�9lR_:E_�_83ܺf�1P����6���'$�W=���g����ہ��A:��1��O׋�n�jѾ�oO���cυ�.��v�;1��X��`B2�$!�����s��+�R94�D� b�[s�'�'*
~�,*�h��ӟj���J>!�tU�2]��͍uU�@>�*�,�ꗮ������Ұ��.��^��8xZQ0����n���t���ban�z�X~� z9�ٕ�ߐ�(�s��W~��;����F���K�4_Jh(�fk������F��C=k �$G  �Y�?_Z�ϗV(� �w�I%���Dvg�/��JI�'A�g	��m}͝�0��wL�}s�v����^�)�ig�c�#p �-Ca흡���C��<����&n��R�ds
J/ `�i��Bb HF� �q�X�m,�����.�jڮ"�ܡ�6p��������T�ѹ���18��9 ̽���r��^o�]��b�WNJm�'F�U�kal�j�}�) �xc�S5���ƞ;�����.0�v�$Ŗ��M��1r"5�9�n�LDCC�+(��_ lݾ�5�K���R�W�.�U��e�aj�d�Y��'8L��k>JP�V�[)TǢ� ����/K��w�A5�y�)��v(̌���y�G�ޫ�ߩ�����AT�f0V6��jT�"�z�g�/@�;y���0���n���g L�]<q��p�d��j�"�zsg�Bu�RN=6x�։�C#7�"��h��_;w�u��䮶��{('��8�'��̨�?�M Y�B�I ΗV\�m0 892�R%��׷ !�WL h��23���� �y^�B[(v�v�KXs�e�7OR+{ض�Y T#u���06�J��>���v~�gϢ 6
�� �8RV�U��~�>t�H�J���(�P������=}�Iu�u8�ʣw{��P��1��ا翸w�'�Q���s,8��ص�:�X0dDS��+� �c �UG����j ��c�O;Ҳ��Y �5��F.a�C�Z�jtu� �^�N+����=���J+Q+ ��i�:��`��3�,Y���Q�q�{$�� ��W����y�E��[�L~GѮV�����:�2 ��2+n�H(�~W]��(�0�{qp�Ypm��(6���p�
 ���VDN�1�7_3^f'���(6a��p[�`�w+((��[�a�rfMA5��;��B=k����� �m��f��'� �ߨ����
���V0�x}�w {�%:	
�@��B#��� �^ g�a+o_ VϮH�����n*��v�łc�3y���N��J�s��8+\���^��	�  `bQ"y�`:9�t��H�&�2�Ei�g�ɼ�s������<	�P��%�|k�>�v,�N���^���}�5J+�Y��w�u�C=ý�v�?���i \�[�yr�e��`߾���s�/\42�; ش��ay\^��5�:��/X=�B�o���O�Z�\������(�gO������6ɑ�$ �z�ǀR��O����(���#5�m�Rw5X>�]�Z��,��Z���͍Em`I ��8/T�b����GQ��0��,�� cvBe>�9Z�N*T�j�V`�P�n&v{��U+B�؞�����^p���� �{� �X��[�N~��w2A��  �x��, W��횖�ϫgW!i���pv��,%�;~B���G>i3��a h��]'MJ[�'�Y��}c�����G���I�\��0����N��Uq�s2�W�֛Z�r}�d��Yj��8 Xտ"ط��6yR����&�T�j01]�T�
1p 5�}4ŋ��\��\ƞ+u*�~:`	 ���Q�����J�������g���p�X-s976��>"����`�÷��J��G��}��W�R�?�~*@��P�N� ���-���K�ߝ�&�/����� ���� �2�[M���b����F�nED�q���z�pZ�@�
h�7@9)��se%�T��S�N7O0<<��K�|�j`hj��1�}������O�z,a3o>�<�D��藓si�\����Z�桩�D�k��`owA�<J�aX�+C �vV����� h��Zm���v,(�F����7�}�k���Ϳ|��� �k��+�R;�� >�~�E{����ݥn;	X�[Y}��m�L�v,�8f�\�  Ш��}����E��`�4����;�kf���"?^+�S�N�DS�	(f�-�o�i�/6� 0��G[�[Y����7vg��w��eycR=�ӥ~%�T��:<�!�q ['e���� �j������Ό��@�|��C Rpc}���[AZc_����� 6���z�oc��i@�+5������s �l. �v�+w���z�Z��̅�˶��G1`Lp���+.��csw>�=s��m��3�.=� a�]%�+�[E�P� 8��28�ٻ����8mP0!��{6.�!C��.i{� ��/��KWk�2 ���j��o���B9٘$�jo�*�fs_������%tky�+�����h��a.Mo�����C7J��R/z}���m��m��B=u�ZF��s�͔ �?�߻�  ��j�����]�����Ҏ��
����'�7�����'��DAD�ZS�O�������0�0���9�8u �v��]^=��7�'�Q@O��E,[��U�+����Y�K~hw��t6eA����Y�Y�5��c;>�F3�Z��;6�z� �[��$u���}�Aa�t ['����zW}�� ^��M���s�p黎�iN(ͧ&��m�)Q�?�I�} �|�KUTTG2 (/��ؘ�^R�}�@ڲ E��g�8�����K�<�O����O��:��G�9&����m���ۿ୳#p�hSw]9������ؿ֬��aY\y<w��X�#��nD+���
/E;W	��i� �rU�}���F�����%�]�Bk�P�\�b��h����ՀWtP�OݍtH��<?,L��  4g������F�0��Ǌ]i�E���WFVKVK ��ĔM�z�SG~�W����n �Jq���12�R5�5_��V���8p��Vx]�w�w@ez��C��O[6D ��saM���r�JDqK�}r�o�ˉX~D��֤}�����*�S  �R��s#=wǘ�e�llQZޘ�,kL���l��K�<����O��ϻ@�	a�c �yS�|,��Ѳ�C�ʯr���A�Д�tԊE' �� ��8����'��> +����L��
��p}�~r�t3]�Av��m@ZB� �Z�@FD�'��:B[��5�R��}M�-�go�[|S�	@�@�b~;����o�o�9��[gG��Qہ���7�������F�3��Q�)u�d�$������@P�,kLZ֘���fe�Y� ��W��;-9�t��ۥ-L,ʆ����)=1�2�kM����=@E���9@;'׮�-	9�7YZ2T=ÝS� @�1�=��]�1��˛��FW�z\2�x~H?}�+�YVS^5�{����hƲL[�Dx�,Gڼ�7aq���Pu�N9�����d��:��k��W� n���v}��/J9:�I�6=��x*W�ˀ?����  �^���'|�|����� x����.��5�α��ž�~��^���n\�_W��z���FFnn�`�-�E�p}%���i���M'� �����w�n{2�c�*�5��_p�#�ZpE�Y @c
���&� �Ø�k�����cӹ�9����(@i�q�Q��Nmi&�� Hn��Jk�� p�F�����BՎ�b@Ek���A��5&�ֻ�h�;��jf3��1I���q�3=�^)�̞���G ��$ �Ҥ�Z[ ̊�m�.
�!���EY�c
К���3CW���+���^8��S�� �e�v.  ��95LA�z��\����N��І;�6�M�B��*[��eD���'�?V�}C�5�us��d����^kڐ�U@�42*��ic}a���ҝT3�i`�-s!��o���V葂	I�w���c��o���y��9��8��Q�/����O��(�Й��_{"P93��fW��>���h�12�0.;U ����B���Zj�?:@��J������^�V�� �.����cb&N�3�&,���:'^�%���9س�xE6�+E���3�\��3S�MH0� *�����`�̚�"��Uj}�X>��_�Ā���$���o���R�2w���ta��Y��ϵ����S�
���l�ح����  ��7?k���SUϼc�D�6�Aʅ ߱(˖e�zL�?�.m,-�J�T�a �  ��r鍰�گ0<z�"��ݮG{E�������N�[��D����s ��]�3��d���2ug(��(ݜa	>�X�5��e}aRy�?�0��d�Y(�o������tf� `��9q��>$	�߅
�OEl/<��� �x�l ��c�q�����<��Ĉ3U�ͅ4ڑz� 2�	���D ���5��D�9��d�cE�|������_����m�Ţ2���3�S-j0r��޸�������x] ز�໴�l"���OT��ҙѿ�ӲRȧV
p�(�#��WZ����CAi?\�4@4Td9��P-&�:)�P^�i  m'������ c�X�*�F15<z��x�R@$h=��k�PhԂ|G�EYk4�N�6w�����Js�˥j"zJ��o!`���T�'��"�^=���� ��~A�9��Jb��d(�rb���z��5 ���@FE��[%��^/�Zۿ�LG� �@�/��M^ũ�}��	��h��41�;b��v�?��X��/cD��F���#���i���
1F��z� �����G�1�Y瞮+�|Z��1A�-�I��aϵ��M�����j�����5�&�\�q�{X�}�
6V
p�R%�y�@�|��U�*�`�6�M����]�`Ln�� ��{O��c�PPʏ]]{�?G��-��t���8�x�n`�"�.�FW?zfȜ[q�d�aef<�� �e[;'W��ۡ�w&/E�>�x�����:��Z�FM�|�q>�p<�\.`[i�6Y��o���/x�;-���m�-�՞2����* �6�;��������s�H�+6�'�	�Ҹ��_/P�Z� ԕ��*���V�M����.8��ճ/�� m���s�˂1 �{�=> ����F!D`�Ђt��w���qeO�2z��V�����v�R�?.ςa���  ��V�� ��D}j.C�ȧ/�,� � �?�؋ �&��q�y~�VKUױ�@Fo۽ ��o)ή���/��뺇�k�ŦvO\�l�\EsMa>�8vu힯�CI���:@q�h�n��'b�]kff�R�n�"�N��}���W�s�jy��x} B��7��L,^��9J�U�= �W��Z�	�EY�e�*P��}�FR[�6���wZ�u�/�K0	wn҈v ~�C=4����z���/� ��ogI\���"��_k�
����E ��  �\�t�<De�5�w *&z�R9[}�Ra�U�`���� �fז.���K  �'�튻Y133z�T {���������o\@�'ml�:����b���a�j�<�} U�fI�ZY���·!8N�PRU�X8���=����(���r�ۖ��V���ku��&�۸֮�=�|����'����󃇎�忂����<�A��G+�(�N�i�hwG �}�`�tk�ԝ�'=p�ư^
Y6��Bu�@H�ws� 8�H5����N�Y>�Z�������Z=�k� p*��s9`ͩ�(��S'}@h�jy�Z��ۉ�#&�!�����@�)f�.0�;�M����l<�'��t�JQ�1�=��@���8��1�����kZ��7�  /?K`�Zt�͠��č5� �(�s.���I���0 N�����sG^w�h6�&q�LZ9���o���&�Y H��|��� �Y��׎jn��7n�l�̉ݓ}G�1K���|�ȟ��3��ˏQg����zP!4�[ݴ����	 ���Մ�W"~�2�����d���y�$3&n�r�so��|��8���a�rQ_�����=�,}v���� /�ecX�nNl�N�������^� �pg4�����s\y��ϸ����ӭ�O-�������z67;A<�:��:�
n���3�N����ɌGG=� 4ƛ,-1��T�Q��� /}��������f+��6�n�WO�Ɖ�(jj����FW�z�t����CQ�s�%�\]k_� �����ڰ�\��@F�Tc���%�3��.�UO�C 04|D0�_`8�����`�o�1VCH�s��G ��>���խ �1Mg l�M;��R,�vYQ^2+� W�@�*6��m��#`�7_�Ϳ��ڪ/]�綗ψs�����Ԫ����H�� uز�5<���i�P[�=�{���U���.x�i����+�k���+�a�E��/�� ^�@Y)����Co��v�W����^�	TX����˺�9 �������Q"R���"�j]~�Y3kqa�3Ia�YL]O;�p���/[6Dx��W��MB�Z�B��σ��p=���t�=�`,�v_0��rF骏Ga�\ ��2��I+m��	�WQy� ���h.����)-oL�B��@e؈w.�M���l��- f��]��B `Mؑy E3�F�_xD6�z��~�y����l,^��>_�F^pL(�w��t��l�&�s���+�6v�����n�IEmi��{��֟6����J��  4�r�~u���b�Z��L/GTs�ư�Lo�FQZkWç`k��n��#L�ֻ�et r�tr{�X�,�+z#u@ �"�t����1T=��|���k%�R���Ņ)f8�zo ��B�S1�	w�1˖�[:���W6%��� ���+y�"
{� �=�,�ž�SN;݂���*�s6_�4��%��0ID��
j5LY���k�/���&��3��D�V� >9]�Y��b����m7d˳]J;2�0������w��T��E�%�w�n���9�\؝[���j�86��p�+sgN;�i.?���s�#�J����:����{��,� �d�xۮ��O�Sf����u���KS	t׃��nR�mhC�����r�l X�jB�:�r�cv���/|�o�q� Q�aeJ��Be6�rl���R�0͈v�¡�L��`��CE�A���[ޘ�1����n/�b�"�l)M����+�\�x_k�p�R�.e�ddW�d��@꩘�n]�	w�%�����?VK��wp�}��rHݟ�wB?��h �a�~#�#	�Y0T���zwH��`c�n��Ղj ��
�1L��I����y�m���4(�խ�[&�m�ä��CԒ��a+�����ccp�4��R�w��=w  �m�8>�K��Μz��5I�!����0�&���W(�w��˥��j���o�.���ڕ� I���/�K��؞.n���m
_ZM��L�Gm����&��fJ;W((  �"�g�z`��6������P�`��7Z��w�xt��� 9���%�N��іd#}@eQ̆��� �(ܷ��Ǖlw}fܫO�s2F%܅��OBv���0vp��(���o�ՙ�LB=�����F#�   %�ܻ�� ���y  ������ƿ	�5�m�~�Rq�1�U(�(�wR]
k�-`6*��.�v�,1����Z%L���z5Jy��Iv�6�_��R �rE㭼�j>jG�9e��,'0�]<���嬢�:U�QUPE��{�$�ۈ�B 
��X`�޵�\��\N�Ё�1���^�+�Z;�V���}VΕb���nd��uLF��#1u��e=&�]� H\�j�TגU4�i�G��vg#��X0T+V����ٰBiMkx�������4�ŕ�k>����� ��Սt����25�0y�4~
F��x� ���v�#L0��(��g�9Z)a�R>�h��k��  �`�|��~�����`1��
J9?t�b���I�� vWI���d$FB�h����s^|��@�B��cb��\	�ʄϙʸ��YS�4m3fL�Ԡol5�j)�� �`�ij?ʢa,@��g;ġ�-ڂ_�P�]��V�R_�{P��cB�-��	��5��N汎�- Z��ו���Ͷ��D��ܨ��z �m�z�	뫧Z(I�)�2Slbs�,4SD�Z�\G��������:Ӯ��	���d�=>�#�w�~�d������q���0�pg:dL�*�*I��Uw�w��PInF_�)�M��n/�h�*!T���/����1�Q㤵��ϩ�qL����Z�����+�r��P���*T& �d^�̘15���
�@�Ш���T�P����!6�z�?Z3E�� ����^H�8��͵��@��@It�Z���nLg,T��|��C������Ť}`�Fi˝�<Ĥ r�����C����ٝ�".m:��:��beH5����#��3����kz��Q]ich ��ٽ?$ �w;X�n��ޫϤ�����ۿ6L����US1��Q���Q]@cc��P���
/�r��M� +EQ4#ڹJa�Ƹ#�s9 Ju-YE�D5�C8zI�u+���w�Dݭ�J�{��30����Y��}��҉���	Fr�fm�Y�0Hb���!�ϻxp����9[��;Ͻ䕹� ý����;�Z�QH�s6_�@�Ζ���~ �vL�f'(4�7�ITP����IV	2	� qq�囟����_��E�p�j �����|����"V�tW�|/���k�������3��8b~{ ��#�mH�<c�j�n�gV|�7E.Tg>���=�\�{s����KAa�(�5���`�r@�+��R[��B���"~�]4TP�BE�V�J��H)�0�Beb��G���L���N��vn��;3f���D0 B�j)-p�](���B� /[g
[�]hm��ivCp2�h����Ԫ!��v�c�3%�����l�`	�c�����h�֠}����~�7�X��?ncs!���������9�p��vw#�L	sD�qYl�]�ZF`ý�I֝��Ѳ?X;!�G^%U �G\}
/�:����t�:Lሥ�.�,�+��!��I|�>
��_G�_iɷ�N�?�h�� ��"���D&��������,4��DjE�� ��\,\�.�ֈV���/  � `e&kK�Co��ʖ�d�2�
��	w�*��/�teg�~kj�e]N������B�Bık�,0 � ����M�7�%��"NX�YZ^a���KCL�N������)���jg���Z�1%�@3_�W���.�o$�ر�������� ��m�6�Ufa3f�V��S� (�(6�GtR)����Z	<��  =؃��`�Ի�,�H�;y����!�XY`s�˝
VM �"��7t�I8�&�{��?7�_�iK!��ZC"����Ν��Y3�J���<�g�a*�:��n��I�ִ�w��n&@�b � �V[}A{��Cu0�nl��C���&��~us?� �/_k����oM�]�GÜ����l���o�e����\xW��C�?�!��
3��G Syw��nd�\&�o����  W-���F�,�J}�&���'��v�jτ���a�3��j�B��:Z��<)�Nϟ��$)ʎC��B���Ԙ�9�� 9~Oϟ��& &l�������@<WQZk4���X9@q5  ���W��v�^�Bh �R��������f7%Y��Vd����@R.�V� @��1�H�͍tH�@���qȭt��h�r �nl� ��7�ߏ�^$#C�RY���i,�&\�d��3�
�%%��u������@}HR���B.��S���^!n&����w!Dv�
s�t�Wr ��tȰD �U�.�*�8Sn �['b���k^��,��f�?�|�՘��;�65W��^��v����8�~�~�6v����* ������T�P��*�����`�׭�u+�~C&)�21�b6��α�k��]\���k�I�'ˍ���?O5�����f��b��zZq�S9 ��[A?� 4���'�j�qȟ)�ş)ߨ&�u;���:C;p�q��;3���͏W��Z��p�b]����X��qs@�6dR͹V{C� ]C0!LB��E�G�|���	�B��~4�����G-����u�Z�zo?�>�W��W�@R� ��@Vx�=�R��})�Jc�\(�y  p#�JO��M_�]�A�6`U�]l�'��A�2Sn�m��2�/�uG8�0��c �E����jﯗ��ƎM̓t�+PZM�
�92�V��V~o���;/c��d��pp�G@��-�@�����]��wߐ�(2�|x� �׿2:�|)���E\\,�WG�w./Ԉ5e��O�����G`�*� �av5)*�V3�I~�>�|}<�܁]i��ї����;�k���;��ڗ�Z�� cK��(�G�1���9#�X�Å��Q�ы�:[Y'�T�������U〕wO֏Z� ��~U+p��]��l.Hb��������% .A+���=�Xb �������_5w��K�Aw��t����?yׇoz���h.h�	�m���C�׀uG^w�[A����>��|���^m��\V;��7���R��*��ը����y�N*.��X[��M�:��� �������(&F���U|��W�k���-����/�L�?ZԖf�:��N�0&)�Ұ�T �-Ђ�a��Ǖc<��H4�C �;�־��k�C�w5/��wZX ��⋯Rb�g "�T����VE���P�F����D���G-� $r������u&��R�%�R-�����,�����;��,f~|��A������Y
��kh[�|q���yP���8�Ӿ�W���?���Ǧ��Ԫ�h�(�\���KhwG/�aE2� ���ȟ-��� �v�x��kvZA�ԡ��W  5�0�n>���l�-�%u��8v�ֺ}�}����G6�����@"���ҟs�2�C x��ăe�.T�È;�
������H�w ���l�D R�+b%!�T� י�I�B��:���t�}z��=�4��B����]�*G�!e �V9�������i9�s�S33`��^��w �ͯX��$ xj	 ��I�W��{�� �~[I���=+@�{& �*y�ipw� x�|
;�bV��5 �v����IEcX=�採�2;�xP��-Ū���a�uPRK0O�d]Nl���2N ������� P
���Z!��g�e�c���,ъH��!���Ԋ�.N6��l�I�/��7����B	���ۼx罴>9V?�)��M (�::���q3h��(c��@� ?Г�2��7����;�ӷm�V���ff��� �l^w�ܧ*�����rԃ��I�
E�M�
�*��ʹ��P& #ש2.J�Y�3�j�32���i��nI�t$�@��I-��w��'f�n��e	x�ď�Q
5_�F>C �s�k�:�[?}���w��{���}TU��M ���W]�-��6d���n���������-��&֛��	�W���Of�hM�0o�>�[� �a��b2\��y�J�f���,>y��ı>�X���l>c�:���4�Z����@��*Ҍ#^f��늛:��cI
�Dqt4nDmZ{����ٲ��S�P�P��K>���_"�g�aU������E������Bg@�r���ữ�Й�V�!ˆo��$�Vc� <��|I�d�Y��۵�xl�ʥ�~���WX��7��f>ޮyw�R��&N��0�ћ� �/q-�˶���F�U�kڦ��Tv>Q����t[Ho��ԢgI�$ZV�I(Il�<O���6�H@/����-��r����f�L�K�(ے��~������!vn����-��y�!6������A[]����v罇�-Vb-�3���Sٸ��I&����M�V�-�d����Fi��t�z<�Dq<������ȕ{70$eH�����ig��l
iH�s��������i(��$]�A&�p8�EX��>��5D�_arg"��5D�fk��@ ��'�no}4 ����CP�"! �f�����<�r/��"��G^�<�:�-0�q2�y�����a�]��\�`�'�޹�)��R���Z�T�T�4*u���B���σɩ幯���_�Ո@$n��Ÿ!*w@!��f�po6����욃G@PQޣ���`  !T�'����9�U}�h~�*D�v���<��BԬFR�\�Q�Q8��"Z�U)*�W;�\��)QX*�A:��8��I�� �&�e�d��>y�'�����3.������	ȯ�����r�l���7N��b�8곃O�w�kӛ/��������;�+�O�,?�Ϟ���yd0���ۯ���[��֠���0��N���� QX*�ם▿1Ռ�X�&�e��� `�l���b7��d���k[S3P� �ݕ��.g��1U�kCo{��7���h{�Yk�������~�_��O���o_�����HŜ?�U?9��*j��^u�������;�S7Ƭ@��P�K�uKcn8�,������R�аH��r�r8��Аh�d3 ��3`��>t|�7�`�?;j;��A3'=��q��`z�ؚ�m�#1P����}��o�w�Ʊ�
`���s%K�o��|��U}�D6ت>��} @F��~~p0^7� �ǋR�2�O^<���nuA���מz�gv_�kO=[� ��G$�J�� ���ߗ�w7\:߱E�o����	�՟-�ǣZ�~�  ��F������	�y~����������3 �A�M���A�,s��(��f��HX���rU�U9W��l�t*��^����/�x���wT ��蔲��O�R��-��N%�r`�������ZFc�xh��� ���}���A_z� `1쁯}��l���7�8����v���o~<� �F�r���k9����k6���՟ ��p3�$�����Ɗ�����g�YΊ���F>�g�jՌz�����/� ��3NDT��E."1�P�L�M6U. �������id��<��Kz]V�����W1;}�,|�a�!�`�ˈn�����w|#����3�a46�D� ��3�!F�t�n;A�� ڠ`�է�|���'L�|��^�Z�+��������m46Q���K>s/k
m���;��	��k� ĺn���YXI�	��@��,�7_��+�- o�]�]<��NF�,�;�sQ��l�nIv����RMŔ�*���iE.b�a&�r�l����1J�Jq�V!0�,g`����X�~z�xb�]�̘�u��������}��v���˅��"�k>U����?�����Yx"��b �2�^����� 0�,����v~����E�*��䛋ϼ�}m[`AK ��p�	¹��e�޹l+_K���������m�,�(�@�T3�`���N�C�זm�;�~WcCT�볃�n������wO�u��/~a��szҙ�9��-�� �����}  v$��;S�Oo�l��؆;ݳ�8���$�������{���yۓ
\ rӽ�Y�V�:� ��`+������BG
��v�����]��+ �o�����V�v�:�"/�����\�q�Π�Y��TLy��<���f���r��\���g�?{ ��Rٝ�f�nɷ^���~�w*K4� �ՒfŚM�pyϧ�oK��{��On�����V���n�֝.� V}�o{�
���9���/TM���7,���& �h����|Z��
��C�
3��i�0�(�[�~�H��7��V2�6 ��1@a��+������;s[��G�X��/յ�\zs Q��#d+c����r.�n	����X��fRO�yطu������/V��C���XV,*�>�|�w����� �#�+��ٺ�yY���5������-&�   ?ޜˁ�Z�:n\vCzH�
UPh���n!w�!r�ż�����c4A��۹`W8���ju ���L����P�M4�W����L$(v0�T�̀n)��Ql�B���Y�cmϚ�]g��Ɋ����gdY���!͛+���=J���K\v:�5��� �1V����7e�B02�~����A��~ݘ����akH�8���^�����w_�D�c���]�.)j �����b|�m�66��_|���o{I��(�}���r���+ϕ1�	3�����8'�Lp��9���Z�~xw����m �ߓ0�a7�b~;g���������d�jo2��,ZHX�(��ǟ� T����XG |�{����(F="�c���A}�7 D�z�����kk?ё-۟�0�"F2��F���
����#�,�04��*�mp�K�ifC�	��P[3l��1��3�����E�.��}E�B��;�]V������L�;K'��FeO��R��,~�3M�`Z�jih��Yh1I�:,�������<����|�ID��¢��N�|�������-���R��fy������=�7HZy9W� l�?KOƽ�Q�hG	v� 4R����(@Q}������o^0s�
́�ٲzt�3� �^-Y z
#���c�����/J�d˓�
#�6�b���˞x�q�m�Z��f�.����0�s��<TO�ߔ=�ˆ�G#�A��2�rfÙ���&^Μq��"[�$�p�T||�U�̹�|TJ��5�{�]R�. ����YJ�V`�*����������}8�\	��3g��M bml����Ն&h Ѕ}$ć|kB�g����[�5u�M��������l&�l��8���A��a��|�3`��.-{��Ϭ��G:�γ�M� � X�y�`a�Av���9�t��1X
�Լ״��Q��L�=`�3�\���~�7���z�dL]��z����8&�w6�d��i��]��.�wg��e8ݵ�/�埄�Y��X<}��K^�|�>��춑�u� ��V�F�fe�O�fCa#U�Wv_����"����5�w���0S�N��XŰ�R1||h~g)�<���aϝ�\�ݽn	���Ƈ �ë����/l�=9�$�Y 4AA��3 &��@��U�b؋m�|��������d�=>I� WQ�_�� lZj�L�\��@��q�_��W|�#�l���>l�+�"�h��d���A r�,�H�gq  ��Gd�Z�1X��߻ ��l�S�㤠r�:\�..�޳Syj������@�r&E<�>~MȀ-?�8��Մ4�{���=��q��u@0q�< ��;��㍓�����^	���qnoU��3�7�t���'3���j����Y�\��~$�	���Tѧ�Z�,a@�Y�b��	�;K��* �7W�8>4|hN�'�ݳ8H`|�/���Q;>�����4f���?�6x���Y)����k���A�%�tf�G��
�K��fa���}D(�ם�����;|���iK��]��+ ��Y1x�<�|�[S�k�%j@����`f��wf�n̢տy��$� ���Ŋ5��c_�@�ٴE��Æ8bM�:���&�l���:��rٔ���SM(� *Jg�op	�ბq��^��Y��VK[����u �C���3�n�n~���,�+U?i��iV���:4��em*�*��v϶/�B]cg)���ԝ�"�������gz��D��DO��`�������7�`�)>����7����o{�=�ߙ{�J����F��߰�N��o���~ǥ1؄�X\ �/~��������٣�C{ �[?�w�_����k_����wߘ������� �U� �zW��H���ޘ�1�u����,l`he��d����S@b���E/4���!s��Xm�=q ���Al��D����ޔ�P�Wt������0DtX*���n�q��=7����2j)���A����<M<��)�Ik�,���e�\N�E��bf� X&K�\���S	 �ƚܽ��EmT� ��=�}��n����R�w����T��xj�=������ȫ� �d3ͦ��Q;>�&oR_��(��Y�ګ.�۝��e�2]�����i؍G��cb��s��bw�t�{��݈j��y'���zp5�*�ƮN�N� �w����W���]�:n���?��\Sz��+_|v����*��D��������k�W�>y��  �oL��oL����뿸�Y6�6���cTc���T�E�3���x��
�cK �w��b鎌����}�F!~�1� �U�:xR��E�n�{��L �_=��W �=ө�Y`�o&l%�ĺcke���lZ���8�"[�"[�l^��)}jM�t�e�10���� t�1ݧ�`P�R+i������;r�*�,%z˨���!�����T[���w>�Fk����]�?��٣��f�kЃ�6�/M��P�R]��e0�^�.nֻ�,$����e;G@D��b H�{�D���%x�}.��
K~����F`�{���}�J]Wf�78��g��"؝*n����w�H�p�1�T�����V  �Y�� 8v� }�:  �]���@�v��b }����١[Xf�"�}�$ټ|���}���~Wֻ&1}42-�  /5�.����N�}�T�V`�?z�|�y���� �66���6+�����e�u��X�Nik&	� �ˎ&	aF3�������!����g�,���1��2�1Ver��C��K���>�K�l�4[� O��[��8�L���`z�\�4��ˎ�*�~��񻚾J��!5 ʿ�����*��Pu�[v��Q��B*9B5��QX���̯�`��X۳����	�uV߇����������~���F�
.� �ŗ�� x�9}���P�[e��UF��\#ӂ
�x���r�� L ���  L���  T�[*�B��`���� ����og�m��3�Klr���#ڸ��I�E�ZS������"�������p'j����Rz|�,@�
�v �Ϳ�b�w�?���%&�u  � ��8���e�'V��g3�<I��ĸk�ߟ9;7�	ج>.�W�{�A�B)-���<����z���f!Ы7��e��= 6OG��z_\��ʩ��Pz/a��I�L��t~��}����J�UdYJ=$��F^[qY|��Y@5�d�+AA �uQ[+ )��ZH��Z��z!�4���^���p&�`	��3�S��>���fh�M�L�o�\�ɮ�XJ n�:@����� �	��X;X>� S��[����e��E;X>,�n5�5n��`C�~��l��v9 X�@��  �
��q��3�6F�ֻo�ɩ� \;yM~[�i��T8/�z���d P�|��Z�2�����&ai&����{���G.�wO�M�I��h���n�nX�شfQ������w>oz�^�q����us+�Z8�:�:�=Jz�:�虪�  �E��ҡ*ԡG����ԝ�.��W�DՆ�T  * 1���{v��W�����H�ưI��d�0.&��7Ϯ��7n��X//�sS�,k�`2\ج�n���X���Ԝb~���:;��-�m�w�Y�ex���t���v�   ���������[��ㅶ�/���-P �����3%�(�ڞ����w#G���O���d&e(�LQx��E����rR��hGMA�Dk\��0�|/�����O�:p�-�kƟ ,?��<��to�W�+OګT�S��iW�E����iU������l�Dv�U¶���caw��� ��O���v��1�GpǝO& ޕ���A\x&Åx����0��Gm 0.L�]v��9��`Y�o��~G^G�F�E ���`�JK,���@�^y�������i;����JE�EF�Oyw�]m'����� A��q�Gȑ�M}F2i�^4��<��j��8�=I0�X4=���J� �$V��B�P�˯��r-
U��\���o>�������`��3������	{Y�Sb:P�2LZ9p�w����jm_��QEb[U��p�% P�A|ǝO�8�� t�������V:���][���k}3��ώ�P�����w J�6��6a��8P� �NP?�W�*��"���_�^jh�N��ŕ�p2
 ;)�����C��R�&ݫ�X�qJ�����*����8��;.���^�����H(�X`��zۿ�meC�Q�B�5aK@X�~��?~��Q̷F1Sŉ&a�I�: *D@�64���D^u�>��K��źf�P �e�ps�  Nw &N��+�n�%��x�Ց����T]<�r�+'⑗{��w��c�T�`��x �6x.)X��l�����E���Vkr�L��Z����� (�S��ٿ�8r�z������� �K��no(�#_� ��"�Z�9 ��� ���;��̖���� �zfb�y|� /P����^�M	��d宛�^��2Y�2���L���o�aX�] �c� ���" ����k3����<E~���vߦ�U�n� @%��X�"&Y:-�1���(�pf���̼���`�gƆ.����c�a��M~+}j?�����Ч���]w^�+�
�gʮ�k�Q�� (����^�8!>Th����6��LD���[�	<0��љV�a]�M�f������.p��p�� .7¥&��D�ߧff�%|jfv�|'��Lo�  ���4�!c�e������b���+ ��7��#��i�{������Բt�(����&b�ƭ~w��.@Qi�k`�k{˚��Ͳ�~��s.c��w��5���`!�� T���z�$���n~�6 �W��O�C�2��x��?�/�5��ڷ{��z2�n٢^	�S��_Q���l�[J��Z�b��K�`� �}������w9=}��c�M5�|fl�I{��H5����U���� ��[�|~\�����+ku��ɵ��,��KB�-���޹m��6R}��	����Dx�WIuD�V^�wm-T���y������T�C�[��>��x��@�����g[�� pO0�T�g'��&YX \�� ��49�n��?A� �/ջ�]斿��w��Z�q-��]� @W ,D2� ���T$++~ᎋ ���6POT�m��?����j�}�j����G+{߮�
��!���� 8S|�8  �/:3�v �;^�^���G�e:	K�i�Q����� ����V��۾�Sx���o�QE�w��`�45/}�m/H��~g�1��8  ��e��"853{����4v1M���/{����\:ߩ��X//�΍�e'�R���+����S33�	~������� tp��A�ݲ i ��n�M��=��)"ZcOֆVVԪ��{^�Y�GN�~�ں�w�q�%&�j@cK�����aU��a)�����H��^�u�MpS�M{�-!�&�߆oC&�m	�R��}�z2��M7Ѓ������!����_�v��mU�8-���� ���a��ɩ�t�k6]t�@� �b�� ��s����� ������ebTb��k����`,�?�׿x�(B�O�n!W��V�:�㩙�p����\���2d�
~qjf>�wz�'<wZ���~ࣟ�]���7���5��T���D}j��V���"�ьu�B���YZ9zp���; �|vl����i�E�f ,������W&��&��@ks6�
1 �fiG:�� ���- �]��s�>�Έ1�w�FQ6g����nxd�c �/)��&�qt*�߇Z�A.$��'&�L��E�w?��n�J����W������ԈZ��])y�;)�@3�ha����w������x>d\>��
A�ò#���Yh�0O-��&�����R =�M��ZLgGU6(E� �����~5�_�������pYN<}]h�( (ʨ@���y��9y��x��>�  ����)p�L�w�+�N+�p�/��<���}�����C�o�� r{���-gU�9vi���juT.�'��Q���ϜB���܄I���PW%����9J4��V��fi
�V.�?� � ��"�%q�j%n��H@��|�@z�����h.5Z�����$x!���ʎfO�q�o� �v�A33�^(��ͅ�x�>~�l���Zr�G-ztѢܝW�X���z�/������Ǐ��
�m�ï���g��iw�:z9����o�ԕ�B*~�����U1 :�T�/�`����@-@_���|�� �����D�r�r� ?��f��\��}����^Go@O�B���V?u�/}ݯZ�pҎ �xt7gMh�p�$�������es5�*�b?z8vi��`��K�bzgx&E�;��vUK�A�g��?rĘ�i\��v���. ��ؓ��q��?�ar��  c�yQ�����{������?@�M���7����)�n��Y�.���hϦ�P�㹐�d��x��;�a��;Pڟ~B�Pk���/��~1�=�8Ͷ��0��42x�!���%  ��'�y�Y|���x���<�!�ӏ��Z:�m�~W
�(��(��?m������x$���HOU�MJU=^�J�D���E�G��RU�+����O3H_��  �h �}��0��X�ԍ  M��J9����7`�� `>9�վ���ey$�>���"(�?m%�W^�;UP�\��V1	�Z  ���Fr�m?��X2�N��He��f0�N�����[O}��Pđ���h(��ٕK�~p��nqݘ��` �2����?2:��PN�;�u0n�e,WR��O����&���G�I���
|��_�wy\:�kg4�����ѥN�?x����'`�@�j����p��R  ��i�dpR��������N���֠�Mo��`l:32�ѐա�Oe@h��詝���k@U�@a`�Ϸl��i3�	eaB���O�� �T���~yV���V�z�v��X���Ӻ"��vM �k r�dv�� ��𵠿w��n*'B����fژ�?G#��/ X?� �J��ȡB��c�Nf��'���@r������>F߹,#k�{�їO�fS�â�н�Ro6�:���J��F?�c�� ��������ջ�h������> ��ͫ>�q��(���R[�*�;���￤�|R�����~��c�7��y'l"x- �|l̰�'>��qb$�ru)R����, ���� �h��-�k1'��� ,drLU5c6�?AKLg�@�!�@)"dv��� 4�v�!��谴�9�e; u�a��'�n�A�����)����5 �����xmڬ����������f� �O_�]<�-�1 �|�T���(���� Ћ/����]tT��7<oӷ^��,�Ԗ�gs�����Z��é �NPV�-;	� FN��:�/˝���[[ ypl�S�>�" }z�>@q�I <�_Yt���^&KL &��=(5&�
�'�yV6@f��o�٭̅ջ6}(y�ii���ѬQ��ҬQ(����	N�6q���(��%�X5r�Ֆ������a��#�+����c|��-P�p�]h����on�$Lם �8Ֆ��yzn��T�݊��fZBǫ�L�Џ�� � �%Z!��� 4+喃+��E_�T P+����/#�i�b��_�g�y?P0��f@[t�ve7X��m=9,��G�%�R�m��f0Vb~����x�Twg"�V� �{x ��"���J�|  襢�����������=l�ή<�C �t�  ��Qnc7?�4 �>�� Y)\s�M �Xs0?r�ҪZyñm���A,���d!� ��W���H�E�;t��:b�P
S����2M�`��������/����`��=@��5��Wǳ�k+B�z�EX�A� �b\�����?_*
! 8ޢ���c�>���/�?�!��]�㣒�6	���[�sWO۔zi�r�xr�t׻3��m�>�$C�3��$v����x	�G@#�?{��ůL�n���n���2PG7� �������b�s�Y�?hݖ����7?lV���t�qC9޻��ɩ�m� X��QKپ�mc��؝�XM5��l,�������Ӈ˖#�s"�U���� �lv 4���@�u�[���r�O (����ѿ���'�}��D#�د���ȉ���x���@+�C�?���柾��O��E����,taKA��� ��Mա����L s��P 7ff�I '�夠���� +�=4�ʽ���P	��B%*A�
���μ��Z�'�=�O-�U#pwԊ��T�,}Ϸbr� dʒ���70F�g�Al��A�Q�a��i���%� H�|kc~Խ` ��ˡ��������nJ�  ��l&�/���!D�׮:䫹���3��gn��@5PF1��D��'��_u�gv��̆'E`�Ƶ�Ռ��6���G�['����Y� �ߋ�m�\�</uS�n��4��"	��UuX��nWv�q��3e�ۏ΢U݇�� �襢-�A��|�׀���ʷ��Er��?�[u���aC �F�� ,	�q��
�z�8�2JK������9 ��t�
�33����FX�/ �L����V��A��M|��{�º����l���7��v�.Y�<��4r�X
�X
�R ����wꔘ۬9��SG���iÓk�P��Zy�^+�/Of�Z�-p��� �W8�nU8M8jo8�^���I������bA=�tNB��}��[[	����U��%���·1$O�Z��:��ș3�	 T��Xw���{��Kh�Q�|���V���C�� (*�կ~�Ug��`�T//˰�'��������_?  �P�'��`��\�oLw����x��3�Wc �� :Q���ݰ�}|G�����줊���k����}�@��`����f�}��K�Ї�=1�}A ���V��!��%����)���,������o�Зa��|�{�Ԙt�T�3m��2ŋ7��:%�Vǃ���6�x}��w ������3�U��]�.I#���W�k ���ьmr�h+ UT���?t����(ѩ��1�E��B�r�y�)��P��hPm6wT��w�c���o��}N
s��4,`���B_���ȫ�W�+�w}�	l�l@p^�Ǿ�W��ӋK�;бU���f0V��IX�mf�o����Zo�tӈ��w���Ij2>�/=��
�,Ը�z�� �P�do��?��B^hL.& �|�$ r�x3�l�,�-� �E�XȌ-��Q���P� �J���v�v��L `���_@�w"m9Ֆ���'� 0��ñ��m�Pyf���'X��i͓0:���Y�T1��Z��^�`F*�+���jZ��#"�AdK =���NQkPz
���F.GD��;-~ٝ�kI֪�/���`�*L�A4�Y 
M��������G�tZ�+�y�������������	\�d��E�.�~� �B"����btnn<b?�đ�
��f[S�G�bb�t����nĲ�bm�{]X}���B@}���� pEq���(��� �At!�)`�k=j�f�i�Bu�@j��se@���w3(A�<���y.�Zz�? YT�{M��z��ng���S�nxx	 cW�u��"�W0B\!�ԌN��P�R)BC�̹��m:����{�čᓛÛ_>�\@4����Om9<v��� ����KRP��\ �P�#^O��7���G�}���¸f��1��[�#%�������:�lTa4� ����ū��h��}��-� �/���?�" (?�a�Gw�}{��ĕ4� E�塖��=�7<i ��#�'��ZmP]ַ�jԾ��\(��Y�@�4����u��̙ss#������S�� ��@S"; �~b��g�"�v���*Ԏm���g_~�M�q�8:����=-��i?�x��;p����������`�kԖ͊�ͥF �7u����+��Ї�����3��f4�u�]�:{�7O[��'��HAI���?�X���C�H�c��o�y��7�r��� T����n�e�« ��}=z�Oz8/�^�J*Z� ������K�������CG����E���C ���o6��O�x�2��r����"D��������_�����g�֝��J�oM��� �(��#Qa��1�cG?e�ɧܴm?_�,x�/*�00Aû����|�����҉劓�yo���7Gq��r�~�]M��J�d�I��_���s�f&�ᤩ��
 ��$�|z���-�PS��7���"�r�����x��_�����9g�{ �z.��u����y_�ۇ��}���F�W���^�!��$W���edxxb�]�][~�O�� �� M6���4Hn��.����&���%�eS�tF�����{�][~�O� �A��|5�������V���m`d�Ć���N ]��w��'�Lm ���'��V zK�M/��^��d��_K�t��w����l��&�gO]yx̆�>xx��w�i���7���rJ��oU- ��uYD&�/�ߌkMhG>�g'�)�/�R��w�[��ԝ�X����gj ��%��.�^�e�_�Q+_����&�BZ�HP�@�N~�����a  p�s`�=+�[7�}[;�qZ�L���c�ك����V��Wj�+��յ ��\�`��P ��?�o�Ko��k��i��켳+O:��9����$`��P{�Y���K)���wp��!)�Ak#DJ��y|Ý�n�E<�m��ǲ������o\tjin���Ń�� �Ć! F�7�M>��m�n�5<��Ĳ`/:�����ں��@���|�EW~uگ|�0пoۛ�͓!>CwڥCq�_�X��צrw��	�ђ(�²�nA�����SO��������~� Μ���.�Qk���*fFq`�&�+��¹-�k7�9��`�
���ta�!��֝	Qw&��snh�*að��!��v־y������(�/�1(=�(=^� �i/�5Ȱ��8;�e��y��;՘��`B<��}�� �  	��cY �R��9 ��xo�~(�J�oWv�i~kTA#�BR�v�}�N�ܛ_%�3��  �No�TU�A�S��ƥ���W|�����s���+������ "x�����~ǃ� �V��P	�a����� ⦬đ���$Y�L�m8N��^c��B�@��h��X6@�"^(4���3��m��?������\�/��c�3  F�O ��B)��2B��w�X��U'<yɜ�<�1�䮩�6�0���<M�ꞻ�8k
  v��[_1�C�e?򅞸���
KO~����*���B]���-�n9{��*��|(~�U����>=��;�-)o,XӸ���n ��W�f�~uߕ7G�@;kA��?���U�  ���}9ӵ����ig�{>�n����  T�H�M�a�Q��UZ;�o�c�FЁ��̵~y~r)~�C	�E��؝���`�K�{�f���Z[����G���q�Su���#LW."a��|ޓ:k7,�ݰTR�%�B�G"V�Y��9 p��WS��,��'9�$	@�c�{�BV���8�o> Lzb��y�񾙃+F֣���~��1� /$
G��Ղc��Y�F�M�[ԉ��`E�pC�{�kl�s��,Dbڹ�|+ M��&�����uu�����5P�Og!�"`��h�!B^��<3k�ޡ��'4kAW�Z �K#� �L���rw�|Z"��kD}MH �
�����'n������������x -�z�1����Sv�S�T�糓�� �
��πz�;-������  ���v+i�n�Wے��(��`��z�d���s�9�2)^�j�B��,�;��U+��$$�����l{|�k ؄�qfЀ��T���zy��jc�T� � ��$�Y��G� X�J�E`� ��I"���!k%!ΩQ�Ƈ����-J
�z  F ����δ��<�x
���+Ip<
n]L7�<W��ժx	R���[Dw��v0� U� Q� Z�C�;/�7��"�·x6E!� /$p���>/�9��(��ժ�Z������(��� �طb�4�Y�����ށMQ 8"|�T�}��j��� �����x\_(�榑T�����ؔ.�U�A�z��do��3ܻ�I�[�<md�׻�'iͣR�ͭ�F�q�m���  H�G��-�G&�nQ�@#���;s�fVa�Б��8������cDp��� ���3� nL�"�Y���
~v�? @y�i����+nb�k��}���;y���3f7�TX��uW��s�:I�[qS��g*d�L˓kb�G�U6H"�ZVg�zIz���a�}/Q7 VS-���TK���~]�����׊$��8���������W@/k)�@���H@ ���!Ч.�ZIP9����L�;[�5T��b� �D5�PD��`���ڞ ;p����R����JQ<:�֮Z��#�s���(�T� 
�;"�;����n��i �U�!�� }�B���EA�R ��e����V�&�z]��)���x\w�q�2A9&�s�BQ�N�'Qœ>�q}Aݕ��%1�Ĥ �"�5�w����D'��@��7MH�R� ��#���̄#��72�%<w�|����������t�̹�j� k��۟��w�(��|Ȯ����Gz��?�����5�e÷T5qR%���K��̳Pw:P��l�v|�^�g]� � ��Î
B(?��x�`N���x����=�S��+~�E�Fl��s>&ݳߙ{ȗw_}��ܨS���S� ���O]ğ�ұ��W��ݕtw�X�n> ����_��ɷ�3�SϤ�
Bm3�\��N��ޫ�\9z�7_s�`S��F6���c^��� {!�H@�� ���5��Ӌ2�'��	�<[�]
��%1'�ʅ������b��|L+�IH���ʏ2|�s���N�Ow�q~��fCf���OZ �)��)�b�o�*�}�-.Ju�E���ʡ�W>c>�F���WNA	<�}��'�  l��! ey��; čFF��!`�A��r��5*��� X�:t���e`���`�������  Ģ��>#�6��(цU��: �f6�+6t��e ��ɓ�#5Ǔ&�,4�՞	]��B�k$��a%�m��޶k�nu��ow��� !�]��  ޜJA^�>�w��B��\"�����L����ȰDl�0)a���%���/}����
	V��� P��ZC�
$��Y��� J��	:6�f����ݐL����g�3_�(�K'o�H�$/�\rp���ϋ�W��ݲ����D m��B%�����W�� xi%���   ��8*�(��fKQG@�z�����D�����'�#`�v:#ޱ�4��*Qw�kIԛ �|�"t  -��8H���� �'M�9��v�[ ��?�2��;'��,�w�Y�����[gG�2�ߝ�w�j~�Č��GPjj�V��m��  \<��C+	:tn�1қ����LG�e�)��K���͆�-���R��]�]شd�����%�*k�߆(�K��MK��%����@�̟�a>i%�N_&���I��<��?�
o���W����yPA ��~X1��  hx��c�寞yͬ��?�Y�|��|򈚟^�� ��-��} Pm��`ٶw6w�����ͭ����4hU�K�|�{�&�7�}(�Յ]ʦ�b}���k��_��2�w(������!z��������L ���J�>bղ����ܧ0� Ұbd��:z�l��r�H�R��W��;�7++�@)���-�I4I)G��#�ꛖ���O�=mE6�	�S_1©�d]���O����O� ���u )(e�px�?t���/��tq+L`�6���m\kWv<4;*��!ЪTJ��a��X]�%�V�Vl�Ex��P�ÿ�W^_����Q)�X#���чn���_�K�� �t�U 52��� {f���\�@rb�{Jh���< ��x_��$;q$�n�$�#:J�$���^�%�iIQ��u�S�4�2��د���A�],��!�;�<�v=ͯQ ��-��L�k���������3�v���{|���+���<���ʵ���H����TԊp���5jEu�b.����t@�l�1�����]
�D!��(8��0�LR䉠%
��i�!"�	Qt6a@�yAKZn�о��y)R�S��í*�R��ِ� ��y-	��]l�=�D�DO�a����y?�~M<�n��	��OS\���(���   @3I���v��WS�@[�׬x\H7J�������C?��DA����sR�����:
9�!�7(���F�"���备wv�WauĞD�-����c���|"|�������g˻d���_f�䗺d�W��FQ���{��Q����?~������)�Tہx������̂���XԬ����
�̨��H`vϖ����"
L�-R���L��� �#k�>��/rt�d����0C��3��_��l�������Փ�Ӿ'��)8�_|"0<�i}��wW2�D��jQH���L~��&h���U��kP^��.�:��j��TlG|������b7�;�ch�������1A��f���_LG5+�9�6\@'wN�~���Ćw�}�w}�o^� V};���Ӓwxd7�7�o�B"V};���A���D_���-�2D0�״BF�;�?b�ЪL�6 �#��0�?;���{���  v�;�ZI(Dԟ:�|�$5����NC�tQ
�C��Fi+�wm��ox����F�B�f����f���F�bͷ�ڇ	����F�z�wU2�j����i��E?(���$I�l#x��w�EBR�����y�I�>�_$�>ф��쯟zO��#gR| 5(\��vvz�&0����������ޭ�>��#k����� �|ע��X:t��@���v�Lz~��Ҏ��V�t!���? �嵟:�42[����>��H�mt���Lw݌Lw]��Dƕ��[����/��|����d�l�x���������tA�����E��u��`!�x�f��C���?�`0:��hAw���jj�n��������GRLcz�\3���^���Z�-k�v������Y�3#���gn}�pɟ<���z�O1z'�(���O?�J���)}�ٿ�KLI�.g��;�	��1��L	��� �7}���
b(�>�S)�����>��w�C��{%�L9��?��R�䙌�r�LFO9x�ѳ��P���� '�m�/��}�e�l#x��0ji�P��e<(���.��<���9{��Ԡ&L��]�(S��v�No��Wc���
q�Y�V�.�`���H�Rj�G�;[O~��e�����zzoT����7/_O���R�c�~h��*���z�Ļ�]��W�>�p�$�}���&`�$� �� }4�>��(d���Ǝ'���HA�y_���/����(�@!I"-O�C)>��{���E���?���|�� �vqW*�) �G;V��#��  g��?}� ������'�c7~Kj�O�_~�4%2��}a�Ƽ�d������sR�y��]W	���K{��	�/W� �Gv����e7}��G���|��8v��w_e�x	�`Y �!3�v  �N�9vI>�O�>��QT��Zn�ZYK���dZ�L ��w~8]�����D�}>�l��h��-3���y����8ل���t^#�lp�f52x�4'�y;��3py��M ȯn>�����٭o~����-GL���e���s�_�}E����"�����GM�ᬭ��  ����#p��� �v�~�������[?����kU7�1fE���`*%�J$�@	�J���'���=���3��sE��zj��$�l^w�:Awf��
� �C���u�6�ZPc%j�D� ����W�rk	P+V3�0��ׅ����v-_{�<���	U�0�,t��_�_��;�]��+|^?��;������ﭯ={L κ����Q�  T ��� �iQ���M�0��$�@3��p��'��7!*)�JO��k����Sc%�v�F���4��E��6̂t.DkER��D��D��x9�5V��^i.*�� f�����o!����B�'/�8��* K� Ǜ���%��|��1���gAS�([��t���,ЁrL [�� \�*Tzq.�;�fO EL�����4�-U"NF� M!� 4"�i
 ���#r�! ��{�AD����.*��
qU ��go�E%Ц������h4����ڔ��V���YA>�1`ٱ�lH&!D�;ٹ�l��p���S����
�2a��(=Pa 4�/�&*Q��.�FCt{� ���<��EӢ{!.t�������
* d�MJ,�yT�IEP�D�Zb�0����y��`R(��=����h� ��j��u���w0S����+d�yGx� ��w�5�&�8�&T`(Oމ#捋K��q�4�-* ��g* �:&��/D��39��(���n���4�:M��0#�G������kh^�}��ܷ~զ�d�`��u{7����Ы��{$.������{A"/`���B��P%�н�H���+%�ga�0� P/%��(o#�zIގa#η�
��������,�N�{��Y J����g`�
��o[�^���/ŵ��E� V��yx�G�BІ���Y®(m�7�,\���N�Y��gy��Ui	*���P�� �(��d��w0�?5������o�_�������h���Ψ$��gIk�9�˸.���v�v�k9��4=I���}!����,$K�R�� :�5e���{rЈ����e�U�.A�"�S���^�9KRk�uѹI�Rx&�?4}�w���Z��wlH`w�ɛ' 8���͛���+�?����Q��lX
��aeYX�N�W�S�p���a�kz|+��VB=l�)�N)�]�Hd�,�JT�(�6t"�o�:Dn��A5»Ӕ�m�~�?w�+�$`��l�WGВx�9t.*�~S��{�ϲ8��}Wz��' a7�4���o�}*��]s��4���di�f�318��!7|�d�{�6�Gdr&W�Sb+�=\ۥU����4�� i���<˓�e{��n��A�����$�J�u,��-`�B��>��bz��2�Z�wr p�+�|KVa ��&�Q�e���ep}x�[�f+�� `̀��lx�ȋ;ڎg���c�_ؽf��e @>sj��x���Դ��y dS͂rP˵�6v�v	%3�P����RMOD`)�{K�J��tbR"��ɇ� �
i�:�X�3��qVg�W<�  ������[���M�������2ԙCa@��x�z�/L&��8�T-���=@&�y�PZ���ya�Y �ÑE� �|i�k�j�=I��z3~Y� �3ݞ�h�{B���7N&3ݝs4�^��bьG 0}o�Lǣ'��׵i��T���Be�|��b�HmC
!�nJ� �!�����: ��	  ���_�o�ܷ5�x;�SgYj��jؽ�
�>g3 �Zʟw�����M�N�X�N�~�ZL��(���_�M�vE ��������Af4��8�]�X��%��h� �r�@_�:
��s.�kaā��:�{�����b��G謑��- ��.�;A3<Bg�̾�G#�
���4�;28m4-�DU��j�@d�{�Z�(t c � ���9� ,{!H<���(�Υ�O6��1����x�Z7���2y�aS�s���K��{�&!�Z��e��U�>g3k���ϲ�Kn�ݸ�_�6��8�nÛ}�7Boz޿�ũ����8V�bJI���AS(E�J;C��M�����¡����b^���p�k�r(W�C����U t��2Ⱥ�DU��@_=�e\n��	T=$�����2�@`1�q��t�+bM�������������q��+[:[��Wн "�w�//ܧ��X�
 �Y�x=�1�b� ��XwP%#����
, �)*��b���r0�� ���7?S�o����5 �l<�3|�o��D��%7"Ǣ`1	�$���� �.�o�{���;��k$��ʲ>��qJ�( ���L:yˤ�2[�Z	 d1*�j��d�O/s���/u�@mqd�R8s�_�����T���Sώ��*�+��;�x8A��<��l�H�A���ۙ���ů�a��#A�u�~���g��G&�tV�;8Cٴry��t4��tL��W`��LI#~�����eA�.{�w������͋�\���p��aR���e?�f7=Loy�[�h�-� �iN��q�2qDSNR�Ty��D�}D ���}� J�_�78��h|��j ���M�{�;~1�Z��ρT�nZ} �3뿀�x��.<������"��U����bQ���ƿ"��M_�U�(�}a p��s���CD��; ��W���%�GYK��: ׳�8���p]�d^�G������; v* �T%Z;AbZwنN�K�@�+��� �%  ����������A�%�oq ��������Y��է��o�p����r8
q��즇�[�  �(�,4�;Oi �l,q%%���ǵ�K�)�1]�ؾ�z`�I�Jy�kfG�=W�bTp��KJ˼�4W��w��ӛg�R��S�̢��4ք���r7�{ D��y�4���Ж�#�"P�<�jy�1P�"�4(�������(� 5�+�}I	���T(���n��[KxoTc�5��������=��uo�;z�޾�k��4)��-諞u- jg���4q�~ḥ�Ά*�GA	|b���[�	��G�07=��o9��[�h����پ3˓�kq2��SB�Μ�sݣ�3;����c�.\; �����yȖ^1�@w�;u��y�uܗ?��Tpgm����!�yц<�6��Y�����X�_��<�v�;��S1���[� }��hߗ^�Oxx�g��;�_��"a
�o\�����X  ڠ
 ��u+�塉8����e J��PG=��:3����(��MK�-�H [�� B�+��-`�h ����s[����L<�*^��!p�t��c3 Ͽ�8o�x�=�.��~��	GԞk-%�����Q ����C�1����A+��ZF����J2�< frƎk��)O G�ԧ�µ=p�����3;��(�>�� ��ˏX�b� ���nI���І��N�(��R{q��s��{X���30�R��ۿ�Q�����ۺ����.��j�}��³�W]| � ����w��Sˆ��� A�x�� �@��v�*Dx|�;@�j�����G��I����^6Ԩ���ߦ��M��zˀ��vˀ��� ��6�`V˗���U"��}0���xQ���,�Mn r�{����wX�I�ۊ3���e� �=ws��κ̮�:�& .8T`�^�:�m:���:�wh4�ry��l�ȋ }&;piYrr�M���۽��?2,����ܰ[�(`��s�kP���=��Z)��g'w��� �ϵ�kc٠C#4\��@9�3���A-�
m��;��
�V��_�g�����u�}n����Q�Qe�ʴՙ��;��Q"�c2~
���B��+ �����o
�@�U�y�u��/�F �㮣7�,���� ����'B�i�4�i�t��L~8%��u���6.���%y[�V)� �
`m^���y��(�/�� ���ls��9w�\��@�w�� ��0�Xcuq�P�ӟ�)�o�`�����c�v����$L���@�Yq���>QZM�wfe� 0/�v�G�J-�� �+i�5���fgb`P��Ғ��ر(UUh�w�2ࣷ�Ճ�m9���{_f�wLW�fSb[���i�z'ЭF�?�4  L�� ���@7���9.68
�u� �w�j�)`�TƩ�L���̻&�cg�6rqz��o*�=y� ����H���K`HK���B�k�ФP����0
��ծ�2�� �٭o~����G=<�*����D�T*q�c��P�T�T  ',[���O����i�65`R�,���=���n��k$'  �f���}�,�UkK[i7 �%�b���m�䥑�Z�J��i��;�H ���[��6�6�k��GlN�K��}G� �*������"�:ت'!�.e�/cd&���"wkõ��UսhZB�@�r����V	��;���Wƭn��]�E��A9��㻮:��jKYҵ 0�x�$�J�/�W8�n��=�g�)S�JP���Jg��G�����< ���@ʥ���ihe�#�w�+r�S@a<Zi /���ck.D�b]�*��(  �˾�v�t�W�{Jn&�*���䡷.7�xZ��Q� `��Ew����ޤ�
`�4@WtůT�c #LX)^�m��
 ���$�`,l�A'J ������><Z��*����2�4lR �X(���i1!�L�lZ�����I	@6�'����8y�y��K�5`,���]W���eR����pnϱ{\�����U�@ o�P�w>R���Y�h�qӶ\a��� -��p=aɕ h!��5�#!��/O��U�7����*A��[&����T�K+�(l�޹M(+���^�^��a0���c X ����2>�@��� ���8&B<�|�y'x�2� p� 0)���,x~��zcBk: �|m�j1(�f�Yt�i��Ґ�)��`	�}�A�}��;��D�ˢ��~����_v ����zg�G���$v �m:\����((�ğ �6����] �w�?W�Tq;������`� � Xj  x$.�/�ႝ�?ޟ/��pm4!@f�8�U E�K���7g�գ�f=t� �ܭw�G�:���ΒB�����N�Co�nH�:�W��Q��'V����q�W�
�M�8Uخa�^) \�5��2E�㕇�����l��B �E1�����hT0B� ���M��zVҪ�Ά� �+;�d�p������s�����@���9V�č\�1 p5(�{K ��Z�*n��77\>3`�U����NlMjV:K��ڬ��U�)�z������!�W냰r�)i��D��,�$�Dټ�mz�o~3��ZC jOH~)=��!7S�}!�J⽦��k����N���rRu�к��e%�w���w����%d��U��	�G# ���Ka�
@	@'�Tam�x�B0£���Q���H���nϾ��$W�m<�!;���/�{`�I��'�������on���om!���j ٯ�B o}/�k��m�f�����?R�W�|������u	�G�w��]_xc�}�	�S�}kkv̟h����)��c�c،�Am�ƀ�&U�;����wG�޷ �����@f�J�H*b����ˤ �I�Z M �T�2��D����x�O;��߱J��ur�e(�;������|TOmd������]���
���Kf��
�Y#� �Fԗ�X�ϻ+���ӥ23v��	����B�0t�
'��7�`�}|�G�2�mx�+Z@U��}�wA�Y��i �J&j��*Q�x�	�+���6�
��y��쥽��
zg�����~�UR����Ztm���WWԻc��W70��Jv�����R%Jt"	��W��P	�a"��%ҏ&��C�Q:���N��{`�I��p�+G��F�|��S�z���Mw}�����p�|	X�P��D�d��]��P�6�,=Ê�@���{�z;���⏁���4�>*Q�u��a�y���3G�Uw<PL�� @���'q��/U㥬� z3P���7-�Y��@^����B��6 �u9�[�
ův��� ����Z�L!��R|&(C��D8��0�4>�%�|&!ǊX���酇��ĝD���艐��7�ú�X�W<, n�:��3���:�5��1h��o4�M�w�	�6 �&���-�
F� �3�J#-����R�zj#�7? �~��ȇ� �W7}78C���������i֖TQmJ>[,�nXA1�hQ�1�Y��aW�@��7y�6��#9J{��j%B�1�\zoJ���X1�'#s�uc�^ �{���G�ؕ����)A=� q��yP�3?����6q����&�=���������-Q �4sA�1�D%����ˠA�qAbP�l����&�Zw�� ��~gy
�9�����2Ib�tG��3]Do��|G)�g�&����{�����K�Hz$��z��n���v���,<��I?�n�"  ��,�&��#K �ʹ1��<  2M�8e�)iL��O� ��P�����} ��{�k�NiVBB��ꈚzA�cn � ���Ȃw��?r�ҕ�k��ff���ߟ��kGR�v{#g�
c�OK{E�1�r��'��R� �zB��M
�04��Ӹ~]����'��J�3��E�x'P��hJ|c�b�}>Y������Ϙ=z�K�= �^=k�Tj�I��F�����%�c���]�o�5&y�+�z!CF=uhX��^��{��9ܛ��DS�f5��g��|d]�l��ŝ^x��X+ִ�Z��+N�)L��^;���gQ�I�2��_zH��aT@�Oo� ��YI�������f}4v��BP��9���4��<[/��rk��EBΣ��B�a�@�L]�I$��P�X�o� Q�v�M���wm��A��e����#�!p �x���&�=����j�pWF��G�2?����' &jr�j�(��۷����V���ԉ���׊����y�iҬ\}�9�q8Sn� ��.;%vJ�1�M�[��5W�h����.W�� ��|5Ֆ��Ǉ�r� `�4:4���lpJ�>xW�_�}]�5�>L
C
�1� ��py�b  !]�n 2i �˷P��@��o�G]�����R�L �7�����\%���:�8K�;*��(%f�&ļ�$�M�D8T�h+]��
�0�r��o�~A���=���3��sE��zj����Eټ��u�>� Tpo��Љ�:@n-��5VB0�3���  |^�- 8�8E����o]����K�� �6-�����"��ʤ`e����֣0l�03#Lɉb��8Sn( cf*�� �~2����8�]K�C��Jmj�����o�;x�G����dI�S��8�-�ý2/��=]r�K����n;�����m�u1z�S����������o_����OT ���`�T+VP�4D�b ~)]��,"?j��v[h�&�v��[0K��QȻ�$�&h 9cA:���m4ti@iIu8hD`��h{O`�o BTPRi��DhX��T���!*�[K����Љ�Z���i�+�����Q���L��ܽ)zK�z��:��D�K� ���μ(�� ��� �@��+�Y�bf�C1�����)Y��\�Q����坜f�]�.�3��I�1���AP�m��qM��_Ṅ���K������������ކ��C5K zf���\��T��~��!�G	Z�������]��E������<0��/:��k���@�� P�z�7�;Sj����u] :@�$�L���.@�/���X  Q3�Bw�ۅ��.��q�	����� ���xG������(=!������ĤbХIij�@�I7D�3	?����&��Z������K�-jX&`���
"U,��'���2)�G��މ�҉0/mዏᾚ�r��%F:�d���⇾Dl�>m&:�;�J!����j�W"��ͯ9��Zf�e!����Z��f�8a�`�u���4�����
s���pz�?n�>� �T�5��,ze�P��L���x�Q�a���������_\�g��������m��p	��k�k�r�]�Ocqs��, �/-�yi!��@�/�'F.'�*�3M�S�j$��!�d�C�w۔`l�9d�U\�&�S#d>��Ug�	�u�^!�F_=�y�~'����6t"�<9){g;i��I*��l 7 ���Y��iq PH���u ��X� 6�F��7^`��2���!���mB&��H|9�� ���wm� �ڞ�v��|j��f�M+ �`��u�vB�B��r�>k�h �A�v;ޛ�0��[�~O
J^��gOP���vɀ{�
!�ֽPJ7&�O��&Z�D�ቨ9�՚�1�e�RkZ���\|0�A�D���L읢���w�W?.��f@�R�w���Jؤm�(B�3:����X�N���j`���גg)(�t-m��Y����#�j.%�r�s�����1;v�X3�i ���0Q�-_�@B=C��Y�>rM�O~PK��ܰ ߲���ϖk6�0�&L ��������=��z�NzH�vńU(�{������,>�ȣ?�_롻���ş�0 `���e�R���Au�����cIoZ� ĕ�&de�=4����XTS�5Brɼ�����DA�5�4v[���oT�1��6	ݓ)���g�^`�p�V t�˙��[[���|�Ҽ�%�(��
v�{����x��gn�_?�A-1�˦k]��⒟  ����QXa�O:���ܼ"pߙc �6@E�?0��/�N���vRu9t�y�A v�^�I��h��*���^�T�����k�IG�^ ��ht����ۄ�#�O �� �2K6)��@�Ҽ�
 �iDjːǶW YD�Y�IҺ`R�(���;���R�xd�Ͻ0څ4�Z�\+S@6Wa�t,�"U���?�������Q�����9���.@��u�g�y�Q�u�Qq�ś�E�M9Q5*���=PP* ����w횸�/�Ϟ���`�_�co ��Xl��kG M�Eh@Վ>����h�Guw'|`�/����! �����l~���? @��7�}	�N	8^Gl"�+UQ��ì&�T�@"�Ұ̓�.4ߒ���n��L;���D��M�� 	c�� G���L��	�%��?S)�ѱ����i�H��6��o�)� @�ȡiG~���G9|��4tD���7���bh����=�����ݮl ZD���-,zˎw �G�w���_�`�_H�W65m�T�$*�`�Xe�y���M`$����X,���e���fäM��r{���{`��,��bC�H9T�k	I)��(��]"��Fb̙����L�d��,��͒�0�N���!��6�����'/��}ٙc�x�����8	檡F3Xs٤��h,	�#�4i�f�0s�O���.���׀"�`4�n��s,6���� �04��)V_���  ����e������g�-\�1 `��	Ǻ8����^9���v`�]�@;��0��@���䫖�a�C���M�% n�߹������q/%�xio�����{���2{���?�U9(��qX8��w�����ҡ�1� ����e�Lو<:�����M��a�e/� `�<��i4�-��oNX���&\��GC ���Y��r�f�����37��n�)E�a�y�^�Fj�	���u1��X  ��m��?�N��w�_��i[ª]������=^��R5@5cU.�~��?6��[k��l���8Խ2�𜉥^;a���.��N��ꗽ��t�Jށ���#���(Q!�S��A��Fa��*� R]���|�˯�����0/|�o���mC�Dj4���6u� �g�Q%ᅙ�bp��M ||�U��$�@݂��M�8a�*�,N` 0Sîh��1�ű@چ	2;&T�&)ЈF�g'�(V6V6�Q{"����6{�^��wMG�x�Q��٨(� �ֆ�ǒ޴�5ȧ�x�Z
�pj0��b��)Uu�>=\
u ����~���Qf��)�\�"��l8i����.䧁
��e�ť#�������}_��/�_�����ȉ���d.���z���yw;�M����e�7	�C��V<=X�۞��Z	�N �����]0
 ع��~�� 
��vK=���F k}ߠ��
�@Q��/  "C)��� ����)����9�(���5tM�h�2� �J��D����@;R,'a3��xnk����DŜ�W4���j����W��9h%r�$�Z'��Ū��udPl ���y�dХ	��"y�4�{�T!�d�C3�C�gF g��߭�+����������/��C��CU���?{�'/_��/Ξ���nnkNF�5�&2MYk�9�H�PUL��'�����o����ӒÚ4��nUA �W<��Y8�@��J����6�D�o"������� ��}�RX�Kn�B��u�N�Y��c^Z�����a�>j��b[2Q)�5 ���R���Zq��U�ÑM͂�7ߏ�� l�}�����Y�����j�����B�DA��?�w {�������DӅB�N %���,�����= ��,���a��{6��^�v���=jn �#f�9Vݵ=���%�mP%�b���e �� ķ!b`7  �i�k��@eQw~��}[?T��kf���Ϳ������?���Z=g�<=P� ��,��c�,�KY�'��(Ăo.��Ҿ��r
�Jk�L6{)H, �A~V\Z�4���a�e(+��%n�JQ��!���4��k����3;�����ӓ�f���@[s�cQ�)���hl�??��h�0�� �5Q)�n]��P̏w�����o[�˹
p�Ĥd&&e|w��q�4�A0���������5�✍��.&<S��!��䦺���_u�P�B��ϋri ��(�]�3��w�n��������w����~����z���'2�NΚ�85�X�����Q�_�L�^��Jz��~��c��c���&�?xd��sw�{�syb�> ���p��� �d�Qu�w��� SE$z�;�9������z�#H�_5����a��[qJ���Gc Qs�K{�x!��Y���wV��b}%�� �؍ɽ�L�7E:9'��9T)}�������23V4H^�2P�«ὰR"v����	��pN=�@�	��0�+��cn{�yT OU�:<�D|LK#�Y�4���
k^я���	G�q�{����d��n�v �ky|v A]I(����%�6Md�KH:�0F�� :������w/~2����'�R��Ѯ�'�㻦��z�>����_���I'o{�x�qϬ��Xb�߬"oUI���c��4sI:_�=�-�x�+{SP����j�Z*�x9�|�1ܟz4�{Cx4vyi#�D��K� �����r6��A5��n�jه�v	��Hu�9�V�$�K��ޅ�11D�rxd� )�����[H�O���%���)v�(!;ɫ���(�F�Bx0�� ���ž���^�n�W�������{I�[KaZc%�gG��� ��l��t���o~aQ�g�^?������#?�|V�+���i�P���əs7ǡQ� a/ -���ܹ���Y{&L�5�e����"1���ľ#���M�z�u�Q�o_�N:	@ģd�X���cq�a�v�a��\蕋-br1AkJ���ͳ�R9�l� �ŭd1Q)�~)]�K	 �� -D��P(�N �i,���AH�!��y\�m�h~��C��%5AV�z1�6U�p�0+:��Ξ �p��p���ā��m%R����}\N��#@�.�!�+�C6"��Ͼ3�8�)�4n{�ϹP�@��Bax���B�X��7��ͯ�=i���2o-���bf�	�ɯ�2[>d��\����8}�B��.=��: ���X�X�g.u%��Ǽ�0���-n��o�������瀓qo�[���˶�3���������J)D������[[�U��Je��tY� �T࿸A�I�̿���<!��H�!���s�K�U_6Y`�h�)u8���1G�"Q�x:h�c�o����F潱�E�8�����������MK��$'xiD޵. ? �WD�r]'�	t�FQ	A.�Q�zE����~W�ɷ2��9�A,�S���F�����v�x+�	�`a��gt%= ��%�������[���<�-'_{�Vk2Z8䍯�ۅ��l�a���y��C����t�@�]e��ǧ�K�W$#�<��)h��b^������aJ���y�_�\�m���W���I�Z����/@��rچޡ8(1�$�1Țn�d{�Ay�3r7l�M��hƦR��d��_?eO]o����S��4!)�__�B�9tD��h)��1o��P� Q��B�ʣ��W� ׼�_�-S����H�
�L�``��#Ew���v�q1���/�Ч�&�o���蹽�G��C��B}���R{y���~��_�����^�yE%l���ub 7lb[Z�(�R<?���B>t/R���_?H"״d�n�_o,r�}�DO>�K�+�܍f �<ɼ��q��;��<�Jh�cҬ��vf��d�R��5
` ����RP@w�{���~�c �G�J׹�� /Dk#61�������)'��|l�] p����D�AUeQ�y�����^ *U�B6u��Cװߊb�A��+D���D^l<t����D�|'S��O�:w�}�h�f�$J��J�C'tB'�^Da4�藀f�W��e{݋�o!@��wT�Q^�~y�����/������m���}��/���v�`�M��$ip�͡��"� K�:R|(*��� @+f�}#J��_-��F�ky)ߍذ��j��6B<�1�b�}" t��{C|�3�TP�HZs�-��uL�c��_~#��~d\�m�������[;�C���fp��9�t���%vb{!J2@J��9^���\zVn�Ūu�b���D��U�I�&�P @��kףhzQ�S
�z"�W��%�'¡��MK�wk�n��ۼ#9$ t6	��wf�����X�f$����� �ۙ���+��\u|ӟR���3�U��-玁u��.+�]'�1�G�P5 �}#�����Z!+&2p�ѯQ
�O��^�Y�!��~�?7�� 0�<�B�!#���<RAu�K#ZkB�<�����6��0愽��00��I8��?��_D�j�v$W�ml��*0J���{��(6�AyQ%�LU�-A�^�b�`��mRB�nm(���Y��� �������k�	h��3��hor��D I�Q/� 1 On:��$YIާ�B�H�,֭F�X��=�	(����0ԺU����Y�i@�v[BEi���~��A5���p `k��g��F��j�>���pjp�ٸ��D����l
����t&0�4B�-JHJj�J�nc�@gR���w� @�����DƛN#�[% ���Y�|��U0�k���>P��r:?�e�P�n�w�d�z��k��+�fp$�J���?� �K�'���� G�}�I������^�qT�@���;�5۳x��-@���[/_���h�)�- ��ّG0�t� �a�C�H�+���[L+�@OD6/݋+[:����t��@.��j�ΐ/��P�0�Lv��Ug	HBv�Ph&[yױK  �y�b&(� @5�y�2w}��+B  �������+����.�*�$�Z�ȉ�� (U��:g��NK����PLKu�	w,��Z-�S<���  ^�B@�4�K㿃�9WZQ����-Gw���M�q}�!��b���W�*xN
�X���Ӄ�����!��iJCT���+�Y�������tG᳣R�{�x�1D�b]:�G�ķu{&�������P<]?|ɹ�>�Nl/D�S��F��ȫM�D� �T�9�*�%��������?�H���Oa��ĤDof�b,�����
��ie2���P����	(-;	�O���.CHO�h�$]@���y����\��p@�#�M���X��D�|1���k�;��K��b���C��=Q+�!�w����6�k@T)W�~}�;��u_�1P���N�ߺ<��C�	6����h#Du�;}z��-�c�YXT�'����}d+%�#Yd����� ��i�sw�C��� l[<0P\\�*� M*׹�l�Cȉ�l ��^�v�OLK�i��ՙ�ު�8v{r�8c�N��~�P{v���HP U�f̵�4��S�N��,r�K	�[o��P�tG��WFHd\���d��j�� [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dqqryjbc7u37c"
path="res://.godot/imported/voxelExpansion_tilesheet.png-5c660119a35f8f9520f397723a19f0af.ctex"
metadata={
"vram_texture": false
}
            [remap]

path="res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res"
        [remap]

path="res://.godot/exported/133200997/export-f4cf891e5f7a93b93d9b27cfb8401ccb-hud.scn"
[remap]

path="res://.godot/exported/133200997/export-d8c1c4ed2031c9625fe55ecac78cd547-iso_roads.res"
          [remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-5b94865898bd9b5cb44e426bf42f6f48-mob.scn"
[remap]

path="res://.godot/exported/133200997/export-5c1b5421b3a3843354800198f9326b19-node.scn"
               [remap]

path="res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn"
             [remap]

path="res://.godot/exported/133200997/export-476015aef76b99fde0b3e1ea5f5c7045-popups.scn"
             [remap]

path="res://.godot/exported/133200997/export-47aea4e83326632d051e4d55761a6aec-tileset.scn"
            [remap]

path="res://.godot/exported/133200997/export-22792ee0018d439a895e1f6e6e7db267-tile_map.scn"
           list=Array[Dictionary]([{
"base": &"TileMap",
"class": &"MazeGen",
"icon": "",
"language": &"GDScript",
"path": "res://maze_gen.gd"
}])
        <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
            O@�jȞ   res://Character.png��C��   res://Crab_Run.pngg]�y��XU   res://default_env.tres-6�ؙ��%   res://hud.tscnۖ ���^N   res://icon.svg�O�N���H!   res://karmatic-arcade.regular.ttfʓl��Y'   res://main.tscn�it��ep   res://manaspc.ttf��f�n/   res://mob.tscn���3{g   res://node.tscnk9b�y�8   res://player.tscn��A���D$   res://tileset.tscnRdVMi��   res://tile_map.tscnR6��ֿis"   res://voxelExpansion_tilesheet.png       ECFG      application/config/name         Mental Maze    application/run/main_scene         res://main.tscn    application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg     autoload/GameSingleton          *res://game_singleton.gd   autoload/Globals         *res://Globals.gd   "   display/window/size/viewport_width        #   display/window/size/viewport_height      �     display/window/size/mode            input/move_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script         input/move_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script         input/move_up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script         input/move_down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script         