

%Define coordiantes for Experiment 1 and Experiment 2

%BCP 37 Colors xyY
Oldx = 	[0.5489	0.4067	0.4413	0.5064	0.51295	0.3988	0.4229	0.48085	0.4455	0.39135	0.40745	0.437125	0.387	0.35725	0.36015	0.36905	0.2543	0.28815625	0.281175	0.26145	0.2245	0.267	0.25445	0.2331	0.2	0.2546625	0.240975	0.2118125	0.271825	0.2895	0.2865	0.27955	0.3101	0.3101	0.3101	0.3101	0.3101 ];
Oldy =	[0.313	0.3256	0.324	0.3114	0.41245	0.3663	0.375	0.38835	0.4719	0.4133	0.4264	0.449925	0.5039	0.41965	0.43645	0.4733	0.449	0.381275	0.3923	0.4188	0.3348	0.3298	0.3276	0.3236	0.2298	0.2782625	0.2648875	0.2356875	0.15625	0.24235	0.22165	0.18085	0.3162	0.3162	0.3162	0.3162	0.3162 ];
Ylum = [22.9332, 49.9496, 22.9332, 7.6038, 	49.9496, 68.556, 34.858, 10.7619,  91.2456, 91.2456, 49.9496, 18.4266, 68.556, 79.9008, 42.4038, 18.4266, 	42.4038, 63.9044,34.858,12.3409, 49.9496, 68.556, 34.858, 13.92, 		34.858, 59.2528, 28.8956, 10.7619, 18.4266, 49.9496, 22.9332, 7.6038, 	0.000000001, 12.34095, 31.8768, 63.9044, 116.0];	

%indices of Light colors
Lclrs = [2:4:32];

%Grab x, y and Y values for only Light colors
Lightx = Oldx(Lclrs);
Lighty = Oldy(Lclrs);
LightLum = Ylum(Lclrs);

%set Lum to the mean Luminance of the light colors
LightLumAvg = repmat(mean(LightLum),1,8);

%store xyY coordinates for light set in a single matrix
Light_xyY = [Lightx', Lighty', LightLumAvg'];

%convert xYY for light set into other spaces
outLight = colorconvert(Light_xyY, 'xyY', 'C'); 

% define 2 L* levels for the color set
L_light = outLight.L; %85.2073 lum = 66.41 , contrast with background 19.26 is 55%
L_dark = repmat(28.5, 8,1); %28.5, lum = 5.65, contrast with 19.26 background is -55%

% define 2 C* levels for the color set
C_hi = repmat(30, 8,1); %wanted to do mean of C for L colors (37.88), but that was too saturated for the monitor  
C_lo = repmat(15, 8,1);  

% define 8 hues
h = outLight.hab;

% combine L*, C* and h for the 32 colors
L32 = [L_light; L_light; L_dark; L_dark];
C32 = [C_lo; C_hi; C_lo; C_hi];
h32 = [h; h; h; h];

out32 = colorconvert([L32, C32, h32], 'LChab', 'C');

HueLabel = repmat(['R'; 'O'; 'Y'; 'H'; 'G'; 'C'; 'B'; 'P'],4,1);
LLabel = [repmat(['Lt'],16,1); repmat(['Dk'],16,1)];
CLabel = [repmat(['Lo'],8,1); repmat(['Hi'],8,1); repmat(['Lo'],8,1); repmat(['Hi'],8,1)];

T_EquilumClrs = table( LLabel, CLabel, HueLabel, out32.x, out32.y, out32.Y, out32.L, out32.a, out32.b,...
    out32.Cab, out32.hab, 'VariableNames', { 'Lightness', 'Chroma','Hue', 'x', 'y', 'Y', 'L', 'a', 'b', 'C', 'h'});

writetable(T_EquilumClrs, 'T_EquilumColors.csv')

outBG = colorconvert([.310, .316, 19.26], 'xyY', 'C');

%% Colors for c* = 20 vs. perceptually matched saturation in Experiment 2

%matches were obtained from the matching task in Experiment 2A
MatchC_light = [18.5 20.48 20.5 21.44 20.89 20.86 20.78 18.21]';
MatchC_dark = [19.22 20.59 22.06 20.15 20.24 19.13 18.74 18.08]';

C32M = [repmat(20,8,1); MatchC_light; repmat(20,8,1); MatchC_dark];

outM = colorconvert([L32, C32M, h32], 'LChab', 'C');

CLabelM = [repmat(['Equal'],8,1); repmat(['Match'],8,1); repmat(['Equal'],8,1); repmat(['Match'],8,1)];

T_Exp2Match = table(LLabel, CLabelM, HueLabel, outM.x, outM.y, outM.Y, outM.L, outM.a, outM.b,...
    outM.Cab, outM.hab, 'VariableNames', { 'Lightness', 'Chroma','Hue', 'x', 'y', 'Y', 'L', 'a', 'b', 'C', 'h'});

writetable(T_Exp2Match, 'T_MatchColors.csv')


%% Plot colors for Experiment 2
 
 %these are rgb values used for plotting (the rgb values for the experiment
 %were determined for the particular monitor used for testing.
 rgb = lab2rgb([out32.L, out32.a, out32.b], 'ColorSpace','adobe-rgb-1998');
 rgb(15,3) = 1.0; % was slightly out of RGB gammut. This was not an issue for test colors in the experiment.
    
 rgb_bg = lab2rgb([outBG.L, outBG.a, outBG.b], 'ColorSpace','adobe-rgb-1998');
 

figure(10)
X = 1;

row = 4;
for i = 1:32
    rectangle('Position', [X,row,.9,.9], 'FaceColor', rgb(i,:), 'LineStyle', 'none')
    X = X + 1;
    if X > 8 
        row = row - 1;
        X = 1;
    end
end

 ylim([0 6])
 xlim([0 10])

daspect([1 1 1])
                           

figure(11)
clf
hold on

for i = 1:32
    plot3(out32.a(i),out32.b(i),out32.L(i), 'o', 'MarkerFaceColor', rgb(i,:), 'MarkerEdgeColor', 'none', 'MarkerSize', 10)

end
zlim([0 100])
xlim([-35 35])
ylim([-35 35])
daspect([1 1 1.5])
grid on

j = ones(1, 100);
t = linspace(0,2*pi);
plot3(cos(t)*15,sin(t)*15, j*L_light(1), 'k')
plot3(cos(t)*15,sin(t)*15, j*L_dark(1), 'k')

plot3(cos(t)*30,sin(t)*30, j*L_light(1), 'k')
plot3(cos(t)*30,sin(t)*30, j*L_dark(1), 'k')

for i = 1:16
    plot3([out32.a(i), out32.a(i+16)], [out32.b(i), out32.b(i+16)], [out32.L(i), out32.L(i+16)], 'k' )
end


