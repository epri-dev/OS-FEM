function varargout = Flicker_gui(varargin)
if nargin == 0  % LAUNCH GUI
    
    fig = openfig(mfilename,'reuse');
 % Use system color scheme for figure:
    set(fig,'Color',get(0,'DefaultUicontrolBackgroundColor'));
    scrzx=get(0,'ScreenSize');
    
    set(fig, 'OuterPosition', [0 scrzx(4)-600 800 600]);
    handles = guihandles(fig);
    logoimage = imread('EPRILogo2.jpg');
    image(logoimage,'parent',handles.logoaxes);
    set(handles.logoaxes,'Visible','off','DataAspectRatio',[1 1 1]);
    logoimage = imread('Limits.png');
    image(logoimage,'parent',handles.LimitsFig1);
    set(handles.LimitsFig1,'Visible','off','DataAspectRatio',[1 1 1]);
    logoimage = imread('Arc_Furnace.png');
    image(logoimage,'parent',handles.sldFig);
    set(handles.sldFig,'Visible','off','DataAspectRatio',[1 1 1]);
    logoimage = imread('Rectangular.png');
    image(logoimage,'parent',handles.ShapeDisplay);
    set(handles.ShapeDisplay,'Visible','off','DataAspectRatio',[1 1 1]);
    logoimage = imread('Aperiodic2.png');
    image(logoimage,'parent',handles.aperiodic2);
    set(handles.aperiodic2,'Visible','off','DataAspectRatio',[1 1 1]);
    
    
    %These are default variables that are used in the GUI.  When changed, they
    %do not repopulate in the GUI window
%     handles.ShapeTableHeader = {Rectangular,Pulse,Ramp,Double-Pulse,Double-Ramp,Sinusoidal,Triangular};

    handles.AperiodicTable = [2.7500,2.530,2.110,1.950,1.720,1.460,1.225,0.985,0.955,0.930,0.870,0.830,0.770,0.730,0.680,0.660,0.640,0.610;...
        3.2500,2.880,2.430,2.265,2.005,1.690,1.415,1.170,1.165,1.075,1.000,0.954,0.875,0.825,0.750,0.715,0.680,0.636;...
        4.4250,3.645,3.160,2.960,2.630,2.220,1.840,1.560,1.480,1.390,1.290,1.215,1.100,1.015,0.900,0.840,0.775,0.685;...
        5.1500,4.140,3.655,3.410,3.075,2.600,2.150,1.775,1.670,1.570,1.450,1.365,1.225,1.130,0.975,0.905,0.830,0.725;...
        5.5700,4.405,3.980,3.710,3.385,2.860,2.375,1.880,1.763,1.655,1.530,1.435,1.290,1.190,1.010,0.935,0.860,0.754;...
        5.5650,4.395,4.050,3.785,3.435,2.915,2.445,1.940,1.815,1.710,1.574,1.475,1.325,1.225,1.030,0.950,0.870,0.765;...
        5.4150,4.280,4.015,3.760,3.410,2.905,2.460,1.975,1.845,1.740,1.596,1.495,1.344,1.244,1.050,0.965,0.875,0.767;...
        5.1550,4.145,3.900,3.665,3.350,2.870,2.455,1.990,1.860,1.760,1.610,1.510,1.350,1.250,1.055,0.970,0.880,0.769;...
        4.9200,4.020,3.785,3.570,3.295,2.835,2.445,2.005,1.875,1.770,1.620,1.515,1.355,1.255,1.060,0.974,0.881,0.773;...
        4.7000,3.905,3.675,3.480,3.235,2.795,2.430,2.010,1.880,1.780,1.625,1.520,1.355,1.260,1.065,0.975,0.880,0.775;...
        3.7250,3.290,3.155,3.035,2.900,2.580,2.305,1.975,1.860,1.774,1.620,1.510,1.344,1.254,1.070,0.975,0.874,0.770;...
        3.4000,3.040,2.965,2.880,2.750,2.475,2.230,1.925,1.830,1.745,1.605,1.500,1.334,1.240,1.060,0.966,0.865,0.765;...
        3.2300,2.895,2.855,2.780,2.655,2.410,2.175,1.890,1.795,1.720,1.590,1.490,1.325,1.235,1.050,0.960,0.864,0.757;...
        3.1000,2.790,2.770,2.705,2.590,2.360,2.135,1.860,1.775,1.700,1.575,1.480,1.320,1.225,1.040,0.954,0.860,0.755;...
        3.0000,2.710,2.695,2.640,2.535,2.325,2.105,1.830,1.750,1.680,1.564,1.466,1.314,1.220,1.035,0.950,0.857,0.753;...
        2.9100,2.645,2.635,2.590,2.490,2.290,2.075,1.810,1.735,1.664,1.550,1.460,1.310,1.215,1.030,0.945,0.856,0.751;...
        2.8350,2.590,2.580,2.540,2.450,2.255,2.045,1.795,1.715,1.650,1.540,1.450,1.300,1.210,1.025,0.940,0.854,0.749;...
        2.7700,2.540,2.535,2.500,2.415,2.230,2.025,1.780,1.700,1.635,1.530,1.440,1.295,1.205,1.024,0.938,0.853,0.747;...
        2.7050,2.495,2.490,2.455,2.380,2.205,2.005,1.760,1.685,1.624,1.515,1.430,1.290,1.200,1.020,0.935,0.851,0.745;...
        2.3300,2.205,2.195,2.190,2.155,2.025,1.855,1.655,1.590,1.534,1.440,1.365,1.245,1.165,1.000,0.925,0.846,0.743;...
        2.1150,2.030,2.025,2.020,2.015,1.900,1.765,1.585,1.525,1.475,1.394,1.325,1.215,1.145,0.994,0.920,0.844,0.742;...
        1.9700,1.905,1.905,1.900,1.895,1.805,1.685,1.525,1.475,1.435,1.360,1.300,1.196,1.134,0.985,0.915,0.842,0.741;...
        1.8600,1.815,1.805,1.800,1.795,1.730,1.625,1.480,1.435,1.395,1.330,1.275,1.185,1.120,0.980,0.913,0.840,0.740;...
        1.7750,1.745,1.730,1.725,1.72,1.665,1.570,1.440,1.400,1.365,1.305,1.256,1.175,1.110,0.975,0.910,0.838,0.740;...
        1.7100,1.685,1.670,1.660,1.650,1.610,1.525,1.405,1.370,1.340,1.284,1.240,1.160,1.104,0.970,0.905,0.836,0.740;...
        1.6500,1.640,1.605,1.6,1.595,1.560,1.485,1.375,1.340,1.314,1.265,1.225,1.150,1.094,0.965,0.903,0.834,0.740;...
        1.6000,1.590,1.555,1.55,1.545,1.515,1.440,1.350,1.315,1.290,1.245,1.210,1.140,1.085,0.960,0.900,0.832,0.740;...
        1.5550,1.545,1.505,1.5,1.495,1.480,1.410,1.320,1.290,1.270,1.230,1.195,1.130,1.076,0.955,0.897,0.830,0.740;...
        1.3050,1.295,1.255,1.245,1.24,1.235,1.185,1.145,1.130,1.115,1.100,1.085,1.045,1.014,0.920,0.880,0.815,0.740;...
        1.1800,1.170,1.135,1.125,1.12,1.115,1.065,1.040,1.030,1.020,1.020,1.005,0.975,0.955,0.895,0.857,0.810,0.739;...
        1.1050,1.095,1.055,1.045,1.04,1.035,0.995,0.985,0.980,0.970,0.965,0.95,0.935,0.920,0.875,0.844,0.804,0.736;...
        1.0500,1.040,1.000,0.995,0.99,0.985,0.945,0.935,0.925,0.920,0.910,0.905,0.900,0.886,0.860,0.830,0.797,0.733;...
        1.0050,1.000,0.960,0.955,0.95,0.945,0.910,0.905,0.895,0.890,0.885,0.880,0.875,0.870,0.840,0.820,0.790,0.730;...
        0.9700,0.965,0.930,0.925,0.92,0.915,0.885,0.880,0.870,0.865,0.860,0.855,0.850,0.845,0.830,0.812,0.785,0.727;...
        0.9450,0.940,0.905,0.9,0.895,0.890,0.865,0.860,0.855,0.850,0.845,0.840,0.835,0.830,0.820,0.810,0.780,0.724;...
        0.9250,0.920,0.885,0.88,0.875,0.870,0.850,0.845,0.840,0.835,0.830,0.825,0.820,0.815,0.810,0.800,0.775,0.721;...
        0.9100,0.905,0.865,0.86,0.855,0.850,0.840,0.840,0.830,0.825,0.820,0.815,0.810,0.810,0.805,0.795,0.770,0.718];

    handles.ShapeTable = [10,1,0.45,0.225,0.97,0.98,0.08,0.07;...
        20,1,0.825,0.425,0.92,0.95,0.13,0.11;...
        30,1,1.1,0.6,0.84,0.91,0.17,0.14;...
        40,1,1.28,0.75,0.77,0.88,0.21,0.17;...
        50,1,1.41,0.86,0.73,0.85,0.24,0.2;...
        60,1,1.46,0.95,0.72,0.81,0.27,0.22;...
        70,1,1.45,1,0.715,0.78,0.3,0.24;...
        80,1,1.425,1.05,0.71,0.74,0.33,0.26;...
        90,1,1.4,1.06,0.705,0.71,0.35,0.28;...
        100,1,1.375,1.07,0.7,0.67,0.37,0.29;...
        200,1,1.32,0.85,0.68,0.5,0.49,0.4;...
        300,1,1.3,0.74,0.67,0.41,0.55,0.46;...
        400,1,1.275,0.66,0.66,0.35,0.63,0.5;...
        500,1,1.267,0.6,0.65,0.3,0.71,0.68;...
        600,1,1.25,0.56,0.64,0.27,0.75,0.62;...
        700,1,1.24,0.525,0.635,0.26,0.76,0.63;...
        800,1,1.235,0.5,0.63,0.23,0.763,0.63;...
        900,1,1.23,0.475,0.625,0.21,0.766,0.63;...
        1000,1,1.226,0.45,0.62,0.2,0.77,0.63];
    
    handles.A1table = [0.1,8.202;...
        0.2,5.232;...
        0.4,4.062;...
        0.6,3.645;...
        1,3.166;...
        2,2.568;...
        3,2.25;...
        5,1.899;...
        7,1.695;...
        10,1.499;...
        22,1.186;...
        39,1.044;...
        48,1;...
        68,0.939;...
        110,0.841;...
        176,0.739;...
        273,0.65;...
        375,0.594;...
        480,0.559;...
        585,0.501;...
        682,0.445;...
        796,0.393;...
        1020,0.35;...
        1055,0.351;...
        1200,0.371;...
        1390,0.438;...
        1620,0.547;...
        2400,1.051;...
        2875,1.498];
    handles.TPstUM = 0.9;
    handles.TpstPCC = 0.9;
    handles.alpha = 3;
    handles.SignalType = 'Rectangular';
    handles.SignalTypeColumn = 1;
    handles.DurationVar = 10;
    set(handles.F,'String',[1]);
    set(handles.Kst_low,'String',[58]);
    set(handles.Kst_high,'String',[70]);
    set(handles.LampBase,'value',[2]);
    handles.cf1 = 1;
    handles.cf2 = 1;
    handles.cf3 = 1;
    handles.cf4 = 1.2;
    handles.Pst_Background = 0;
    handles.SCCn1PH = -1;
    handles.SCCn3PH = -1;
    handles.Si = -1;
    handles.St = -1;
    handles.SLV = -1;
    handles.deltaVV = -1;
    set(handles.r,'value',-1);
    handles.FurnaceSize = -1;
    handles.HighV = -1;
    handles.PCCvoltage = -1;
    
    handles.RepLoadI = 0;

    handles.RepLoadChangeAdjust = 1;
    handles.rateunit='Minute';
    set(handles.RepLoadChange,'Value',[3]);
    
    set(handles.uipanel11,'Visible','off')
    set(handles.uipanel13,'Visible','off')
    set(handles.uipanel27,'Visible','off')
    set(handles.uipanel28,'Visible','off')
    set(handles.uipanel30,'Visible','off')
    set(handles.Aboutpanel,'Visible','off')
    set(handles.text158,'Visible','off')
    set(handles.text159,'Visible','off')
    set(handles.t1,'Visible','off')
    set(handles.t2,'Visible','off')
    set(handles.text90,'Visible','off');
    set(handles.Duration,'Visible','off')

    
    guidata(fig, handles)
    if nargout > 0
        varargout{1} = fig;
    end
    
elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK
    
    try
        if (nargout)
            [varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
        else
            feval(varargin{:}); % FEVAL switchyard
        end
    catch
        disp(lasterr);
    end
    
end


%| ABOUT CALLBACKS:
%| GUIDE automatically appends subfunction prototypes to this file, and
%| sets objects' callback properties to call them through the FEVAL
%| switchyard above. This comment describes that mechanism.
%|
%| Each callback subfunction declaration has the following form:
%| <SUBFUNCTION_NAME>(H, EVENTDATA, HANDLES, VARARGIN)
%|
%| The subfunction name is composed using the object's Tag and the
%| callback type separated by '_', e.g. 'slider2_Callback',
%| 'figure1_CloseRequestFcn', 'axis1_ButtondownFcn'.
%|
%| H is the callback object's handle (obtained using GCBO).
%|
%| EVENTDATA is empty, but reserved for future use.
%|
%| HANDLES is a structure containing handles of components in GUI using
%| tags as fieldnames, e.g. handles.figure1, handles.slider2. This
%| structure is created at GUI startup using GUIHANDLES and stored in
%| the figure's application data using GUIDATA. A copy of the structure
%| is passed to each callback.  You can store additional information in
%| this structure at GUI startup, and you can change the structure
%| during callbacks.  Call guidata(h, handles) after changing your
%| copy to replace the stored original so that subsequent callbacks see
%| the updates. Type "help guihandles" and "help guidata" for more
%| information.
%|
%| VARARGIN contains any extra arguments you have passed to the
%| callback. Specify the extra arguments by editing the callback
%| property in the inspector. By default, GUIDE sets the property to:
%| <MFILENAME>('<SUBFUNCTION_NAME>', gcbo, [], guidata(gcbo))
%| Add any extra arguments after the last argument, before the final
%| closing parenthesis.




% --- Executes on button press in Help1.
function Help1_Callback(hObject, eventdata, handles)
%helpdlg('helpstring')
open([cd,'\Help_Flicker_Limits.pdf'])

% --- Executes on button press in Help2.
function Help2_Callback(hObject, eventdata, handles)
open([cd,'\Help_Evaluating_Compliance.pdf'])

% --- Executes on button press in Help3.
function Help3_Callback(hObject, eventdata, handles)
open([cd,'\Help_Arc_Furnace.pdf'])

% --- Executes on button press in Help4.
function Help4_Callback(hObject, eventdata, handles)
open([cd,'\Help_Repetitive_Load.pdf'])
%-------------------------------------------------------------------------

function UpstreamVoltage_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
    handles.HighV = user_entry;
if user_entry>35
    LPstUS=0.8; 
else
    LPstUS=0.9; 
end
set(handles.LPstUS,'String',[LPstUS]);
set(handles.GPstMV,'String','');
set(handles.Epsti,'String','');
set(handles.Gpstcopy,'String','');
set(handles.Gpstcopy2,'String','');
set(handles.Epstcopy,'String','');
set(handles.Epstcopy2,'String','');
guidata(hObject,handles)

function PCCvoltage_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.PCCvoltage = user_entry;
if user_entry>35
    LPstMV=0.8; 
else
    LPstMV=0.9; 
end
set(handles.LPstMV,'String',[LPstMV]);
set(handles.GPstMV,'String','');
set(handles.Epsti,'String','');
set(handles.Gpstcopy,'String','');
set(handles.Gpstcopy2,'String','');
set(handles.Epstcopy,'String','');
set(handles.Epstcopy2,'String','');
guidata(hObject,handles)

function Pst_Background_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<0 || user_entry>99999999
    errordlg('Value must be greater than 0 but less than 99999999.','Bad Input','modal') 
end
handles.Pst_Background = user_entry;
set(handles.LoadPst_low,'String','');
set(handles.LoadPst_high,'String','');
set(handles.OverallPst_low,'String','');
set(handles.OverallPst_high,'String','');
set(handles.EAC_LL_PstUS,'String','');
set(handles.EAC_UL_PstUS,'String','');
set(handles.MaxFurnMW_Gpst,'String','');
set(handles.MaxFurnMW,'String','');
set(handles.LoadPst,'String','');
set(handles.OverallPst,'String','');
set(handles.RepLoadPstUS,'String','');
set(handles.MaxRepLoadI,'String','');
set(handles.MaxRepLoadI_Epst,'String','');
guidata(hObject,handles)

function SCCn1PH_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.SCCn1PH = user_entry;
set(handles.LoadPst_low,'String','');
set(handles.LoadPst_high,'String','');
set(handles.OverallPst_low,'String','');
set(handles.OverallPst_high,'String','');
set(handles.EAC_LL_PstUS,'String','');
set(handles.EAC_UL_PstUS,'String','');
set(handles.MaxFurnMW_Gpst,'String','');
set(handles.MaxFurnMW,'String','');
guidata(hObject,handles)

function SCCn3PH_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.SCCn3PH = user_entry;
set(handles.LoadPst_low,'String','');
set(handles.LoadPst_high,'String','');
set(handles.OverallPst_low,'String','');
set(handles.OverallPst_high,'String','');
set(handles.EAC_LL_PstUS,'String','');
set(handles.EAC_UL_PstUS,'String','');
set(handles.MaxFurnMW_Gpst,'String','');
set(handles.MaxFurnMW,'String','');
guidata(hObject,handles)

function LPstUS_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
set(handles.LPstUS,'string',user_entry);
set(handles.GPstMV,'String','');
set(handles.Epsti,'String','');
set(handles.Gpstcopy,'String','');
set(handles.Gpstcopy2,'String','');
set(handles.Epstcopy,'String','');
set(handles.Epstcopy2,'String','');
guidata(hObject,handles)



function LPstMV_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
set(handles.LPstMV,'String',user_entry);
set(handles.GPstMV,'String','');
set(handles.Epsti,'String','');
set(handles.Gpstcopy,'String','');
set(handles.Gpstcopy2,'String','');
set(handles.Epstcopy,'String','');
set(handles.Epstcopy2,'String','');
guidata(hObject,handles)

function TpstPCC_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.TpstPCC = user_entry;
guidata(hObject,handles)


function TPstUM_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.TPstUM = user_entry;
set(handles.GPstMV,'String','');
set(handles.Epsti,'String','');
set(handles.Gpstcopy,'String','');
set(handles.Gpstcopy2,'String','');
set(handles.Epstcopy,'String','');
set(handles.Epstcopy2,'String','');
guidata(hObject,handles)

function alpha_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.alpha = user_entry;
if handles.alpha>10
    errordlg('Summation law exponent should be less than 10','Bad Input','modal')
end
set(handles.GPstMV,'String','');
set(handles.Epsti,'String','');
set(handles.Gpstcopy,'String','');
set(handles.Gpstcopy2,'String','');
set(handles.Epstcopy,'String','');
set(handles.Epstcopy2,'String','');
guidata(hObject,handles)

function Si_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<0 || user_entry>99999999
    errordlg('Value must be greater than 0 but less than 99999999.','Bad Input','modal') 
end
handles.Si = user_entry;
set(handles.GPstMV,'String','');
set(handles.Epsti,'String','');
set(handles.Gpstcopy,'String','');
set(handles.Gpstcopy2,'String','');
set(handles.Epstcopy,'String','');
set(handles.Epstcopy2,'String','');
guidata(hObject,handles)

function St_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<0 || user_entry>99999999
    errordlg('Value must be greater than 0 but less than 99999999.','Bad Input','modal') 
end
handles.St = user_entry;
if handles.SLV>handles.St
    errordlg('S_Total should be greater than S_LV','Bad Input','modal')
end
set(handles.GPstMV,'String','');
set(handles.Epsti,'String','');
set(handles.Gpstcopy,'String','');
set(handles.Gpstcopy2,'String','');
set(handles.Epstcopy,'String','');
set(handles.Epstcopy2,'String','');
guidata(hObject,handles)

function SLV_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<0 || user_entry>99999999
    errordlg('Value must be greater than 0 but less than 99999999.','Bad Input','modal') 
end
handles.SLV = user_entry;
if handles.SLV>handles.St
    errordlg('S_Total should be greater than S_LV','Bad Input','modal')
end
set(handles.GPstMV,'String','');
set(handles.Epsti,'String','');
set(handles.Gpstcopy,'String','');
set(handles.Gpstcopy2,'String','');
set(handles.Epstcopy,'String','');
set(handles.Epstcopy2,'String','');
guidata(hObject,handles)

function GPstMV_UD_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
guidata(hObject,handles)

function Epsti_UD_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
guidata(hObject,handles)


function Calc1_Callback(hObject, eventdata, handles)
alpha = handles.alpha;
%check if any of the variables are -1, message which need to be adjusted
if handles.HighV==-1, msgbox('Please provide: Upstream system rated voltage.','Error')
elseif handles.PCCvoltage==-1, msgbox('Please provide: PCC rated voltage.','Error')
elseif handles.Si==-1, msgbox('Please provide: Load agreed power.','Error')
elseif handles.St==-1, msgbox('Please provide: Total Capacity of System at PCC.','Error')
elseif handles.SLV==-1, msgbox('Please provide: Total power of the installations in downstream LV system.','Error')
else
    LPstUS = str2double(get(handles.LPstUS,'String'));
    LPstMV = str2double(get(handles.LPstMV,'String'));
    GPstMV = (LPstMV^alpha-(handles.TPstUM^alpha)*(LPstUS^alpha))^(1/alpha);
    if LPstMV^alpha-(handles.TPstUM^alpha)*(LPstUS^alpha)<0, GPstMV=0; end
    Epsti = GPstMV*(handles.Si/(handles.St-handles.SLV))^(1/alpha);
    if Epsti < 0.35
        Epsti=0.35;
    end
    set(handles.GPstMV,'String',sprintf('%.2f',[GPstMV]));
    set(handles.Epsti,'String',sprintf('%.2f',[Epsti]));
    set(handles.Gpstcopy,'String','');
    set(handles.Gpstcopy2,'String','');
    set(handles.Epstcopy,'String','');
    set(handles.Epstcopy2,'String','');
end
guidata(hObject,handles)

function r_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
rvalue = user_entry;
if handles.SignalTypeColumn<6
    if rvalue*handles.RepLoadChangeAdjust<0.1 || rvalue*handles.RepLoadChangeAdjust>2875
        errordlg(['Rate of change is outside range ',num2str(0.1/handles.RepLoadChangeAdjust),' - ',num2str(2875/handles.RepLoadChangeAdjust),' changes per ',handles.rateunit],'Bad Input','modal')
    end
end
if handles.SignalTypeColumn==6 || handles.SignalTypeColumn==7
    if rvalue*handles.RepLoadChangeAdjust<10 || rvalue*handles.RepLoadChangeAdjust>1000
        errordlg(['Rate of change is outside range ',num2str(10/handles.RepLoadChangeAdjust),' - ',num2str(1000/handles.RepLoadChangeAdjust),' changes per ',handles.rateunit,' for sinusoidal/triangular shape factor'],'Bad Input','modal')
    end
end
set(handles.r,'value',[rvalue])
set(handles.LoadPst,'String','');
set(handles.OverallPst,'String','');
set(handles.RepLoadPstUS,'String','');
set(handles.MaxRepLoadI,'String','');
set(handles.MaxRepLoadI_Epst,'String','');
guidata(hObject,handles)


% --- Executes on selection change in RepLoadChange.
function RepLoadChange_Callback(hObject, eventdata, handles)
user_entry = get(hObject,'string');
RepLoadChangeRow = get(hObject,'Value');
% handles.RepLoadChange = user_entry{RepLoadChange};
if RepLoadChangeRow==1
    handles.RepLoadChangeAdjust = 3600;
    handles.rateunit='60 Hz Cycle';
elseif RepLoadChangeRow==2
    handles.RepLoadChangeAdjust = 60;
    handles.rateunit='Second';
elseif RepLoadChangeRow==3
    handles.RepLoadChangeAdjust = 1;
    handles.rateunit='Minute';
elseif RepLoadChangeRow==4
    handles.RepLoadChangeAdjust = 1/60;
    handles.rateunit='Hour';
elseif RepLoadChangeRow==5
    handles.RepLoadChangeAdjust = 1/60/24;
    handles.rateunit='Day';
elseif RepLoadChangeRow==6
    handles.RepLoadChangeAdjust = 1/60/24/52;
elseif RepLoadChangeRow==7
    handles.RepLoadChangeAdjust = 1/60/24/365;
end
rvalue = get(handles.r,'value');
if handles.SignalTypeColumn<6
    if rvalue*handles.RepLoadChangeAdjust<0.1 || rvalue*handles.RepLoadChangeAdjust>2875
        errordlg(['Rate of change is outside range ',num2str(0.1/handles.RepLoadChangeAdjust),' - ',num2str(2875/handles.RepLoadChangeAdjust),' changes per ',handles.rateunit],'Bad Input','modal')
    end
end
if handles.SignalTypeColumn==6 || handles.SignalTypeColumn==7
    if rvalue*handles.RepLoadChangeAdjust<10 || rvalue*handles.RepLoadChangeAdjust>1000
        errordlg(['Rate of change is outside range ',num2str(10/handles.RepLoadChangeAdjust),' - ',num2str(1000/handles.RepLoadChangeAdjust),' changes per ',handles.rateunit,' for sinusoidal/triangular shape factor'],'Bad Input','modal')
    end
end
set(handles.LoadPst,'String','');
set(handles.OverallPst,'String','');
set(handles.RepLoadPstUS,'String','');
set(handles.MaxRepLoadI,'String','');
set(handles.MaxRepLoadI_Epst,'String','');
guidata(hObject,handles)


function deltaVV_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.deltaVV = user_entry;
set(handles.LoadPst,'String','');
set(handles.OverallPst,'String','');
set(handles.RepLoadPstUS,'String','');
set(handles.MaxRepLoadI,'String','');
set(handles.MaxRepLoadI_Epst,'String','');
guidata(hObject,handles)

function RepLoadI_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.RepLoadI = user_entry;
set(handles.LoadPst,'String','');
set(handles.OverallPst,'String','');
set(handles.RepLoadPstUS,'String','');
set(handles.MaxRepLoadI,'String','');
set(handles.MaxRepLoadI_Epst,'String','');
guidata(hObject,handles)


function SignalType_Callback(hObject, eventdata, handles)
user_entry = get(hObject,'string');
SignalTypeColumn = get(hObject,'Value');
handles.SignalTypeColumn = SignalTypeColumn;
set(handles.text158,'Visible','off')
set(handles.text159,'Visible','off')
set(handles.t1,'Visible','off')
set(handles.t2,'Visible','off')
set(handles.text90,'Visible','off')
set(handles.Duration,'Visible','off','string',[])
set(handles.F,'Visible','on','string',[])
set(handles.text88,'Visible','on')
set(handles.r,'Visible','on','string',[])
set(handles.text84,'Visible','on')
set(handles.RepLoadChange,'Visible','on')
set(handles.dpst_1,'Visible','on','string',[])
set(handles.text87,'Visible','on')
set(handles.uitable16,'Visible','on')
if SignalTypeColumn==1
    logoimage = imread('Rectangular.png');
    image(logoimage,'parent',handles.ShapeDisplay);
    set(handles.ShapeDisplay,'Visible','off','DataAspectRatio',[1 1 1]);
elseif SignalTypeColumn==2
    logoimage = imread('Pulse.png');
    image(logoimage,'parent',handles.ShapeDisplay);
    set(handles.ShapeDisplay,'Visible','off','DataAspectRatio',[1 1 1]);
    set(handles.text90,'Visible','on');
    set(handles.Duration,'Visible','on')
elseif SignalTypeColumn==3
    logoimage = imread('Ramp.png');
    image(logoimage,'parent',handles.ShapeDisplay);
    set(handles.ShapeDisplay,'Visible','off','DataAspectRatio',[1 1 1]);
    set(handles.text90,'Visible','on');
    set(handles.Duration,'Visible','on')
elseif SignalTypeColumn==4
    logoimage = imread('DoublePulse.png');
    image(logoimage,'parent',handles.ShapeDisplay);
    set(handles.ShapeDisplay,'Visible','off','DataAspectRatio',[1 1 1]);
    set(handles.text90,'Visible','on');
    set(handles.Duration,'Visible','on')
elseif SignalTypeColumn==5
    logoimage = imread('DoubleRamp.png');
    image(logoimage,'parent',handles.ShapeDisplay);
    set(handles.ShapeDisplay,'Visible','off','DataAspectRatio',[1 1 1]);
    set(handles.text90,'Visible','on');
    set(handles.Duration,'Visible','on')
elseif SignalTypeColumn==6
    logoimage = imread('Sinusoidal.png');
    image(logoimage,'parent',handles.ShapeDisplay);
    set(handles.ShapeDisplay,'Visible','off','DataAspectRatio',[1 1 1]);
elseif SignalTypeColumn==7
    logoimage = imread('Triangular.png');
    image(logoimage,'parent',handles.ShapeDisplay);
    set(handles.ShapeDisplay,'Visible','off','DataAspectRatio',[1 1 1]);
elseif SignalTypeColumn==8
    logoimage = imread('Aperiodic.png');
    image(logoimage,'parent',handles.ShapeDisplay);
    set(handles.ShapeDisplay,'Visible','off','DataAspectRatio',[1 1 1]);
    set(handles.aperiodic2,'Visible','off');
    set(handles.text158,'Visible','on')
    set(handles.text159,'Visible','on')
    set(handles.t1,'Visible','on')
    set(handles.t2,'Visible','on')
    set(handles.F,'Visible','off')
    set(handles.text88,'Visible','off')
    set(handles.r,'Visible','off')
    set(handles.text84,'Visible','off')
    set(handles.RepLoadChange,'Visible','off')
    set(handles.dpst_1,'Visible','off')
    set(handles.text87,'Visible','off')
    set(handles.uitable16,'Visible','off')
end
set(handles.LoadPst,'String','');
set(handles.OverallPst,'String','');
set(handles.RepLoadPstUS,'String','');
set(handles.MaxRepLoadI,'String','');
set(handles.MaxRepLoadI_Epst,'String','');
guidata(hObject,handles)

% --- Executes on selection change in t2.
function t1_Callback(hObject, eventdata, handles)
user_entry = get(hObject,'value');
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
guidata(hObject,handles)

% --- Executes on selection change in t2.
function t2_Callback(hObject, eventdata, handles)
user_entry = get(hObject,'value');
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
guidata(hObject,handles)


function Duration_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.DurationVar = user_entry;
if handles.SignalTypeColumn<6 && handles.SignalTypeColumn>1 
    if handles.DurationVar<10 || handles.DurationVar>1000
        errordlg('Duration is outside range 10-1000 ms','Bad Input','modal')
    end
end
set(handles.LoadPst,'String','');
set(handles.OverallPst,'String','');
set(handles.RepLoadPstUS,'String','');
set(handles.MaxRepLoadI,'String','');
set(handles.MaxRepLoadI_Epst,'String','');
guidata(hObject,handles)

function RepLdLimits_Callback(hObject, eventdata, handles)
if get(handles.RepLdLimits,'value')==1
    set(handles.Gpstcopy,'String',get(handles.GPstMV,'string'));
    set(handles.Epstcopy,'String',get(handles.Epsti,'string'));
else
    set(handles.Gpstcopy,'String',get(handles.GPstMV_UD,'string'));
    set(handles.Epstcopy,'String',get(handles.Epsti_UD,'string'));
end
set(handles.LoadPst,'String','');
set(handles.OverallPst,'String','');
set(handles.RepLoadPstUS,'String','');
set(handles.MaxRepLoadI,'String','');
set(handles.MaxRepLoadI_Epst,'String','');
guidata(hObject,handles)


function Calc2_Callback(hObject, eventdata, handles)
A1 = handles.A1table;
SignalTypeColumn = handles.SignalTypeColumn;
ShapeTable = handles.ShapeTable;
rvalue = get(handles.r,'value');
if SignalTypeColumn==1
    F=1;
elseif SignalTypeColumn<6
    F=interp1q(ShapeTable(:,1),ShapeTable(:,handles.SignalTypeColumn+1),handles.DurationVar);
elseif SignalTypeColumn<8
    F=interp1q(ShapeTable(:,1),ShapeTable(:,handles.SignalTypeColumn+1),rvalue*handles.RepLoadChangeAdjust);
else
    F=1;
end
dpst_1=interp1q(A1(:,1),A1(:,2),rvalue*handles.RepLoadChangeAdjust);
set(handles.dpst_1,'String',[dpst_1]);
set(handles.F,'String',[F]);

if SignalTypeColumn<8
    if rvalue==-1
        msgbox('Please provide: Number of changes per minute.','Error')
    end
end

if handles.deltaVV==-1, msgbox('Please provide: DeltaV/V (%) at POE.','Error')
else
    Pst_Background = handles.Pst_Background;
    deltaVV = handles.deltaVV;
    dpst_1 = str2double(get(handles.dpst_1,'String'));
    if SignalTypeColumn<8
        LoadPst = (deltaVV/dpst_1)*F;
    else
        t1 = get(handles.t1,'Value');
        t2 = get(handles.t2,'value');
        LoadPst = deltaVV/2*handles.AperiodicTable(t2,t1);
    end
    OverallPst = (Pst_Background^handles.alpha+LoadPst^handles.alpha)^(1/handles.alpha);
    set(handles.RepLoadPstUS,'String',sprintf('%.2f',[OverallPst*handles.TpstPCC]));
    
    if get(handles.RepLdLimits,'value')==1
        set(handles.Gpstcopy,'String',get(handles.GPstMV,'string'));
        set(handles.Epstcopy,'String',get(handles.Epsti,'string'));
    else
        set(handles.Gpstcopy,'String',get(handles.GPstMV_UD,'string'));
        set(handles.Epstcopy,'String',get(handles.Epsti_UD,'string'));
    end
    
    if LoadPst>str2double(get(handles.Epstcopy,'string'))
        cellcolor='r';
    else
        cellcolor='g';
    end
    set(handles.LoadPst,'String',sprintf('%.2f',[LoadPst]),'backgroundcolor',cellcolor);
    if OverallPst>str2double(get(handles.Gpstcopy,'string'))
        cellcolor='r';
    else
        cellcolor='g';
    end
    set(handles.OverallPst,'String',sprintf('%.2f',[OverallPst]),'backgroundcolor',cellcolor);
    
    set(handles.MaxRepLoadI,'String',sprintf('%.2f',[handles.RepLoadI*str2double(get(handles.Gpstcopy,'string'))/OverallPst]));
    set(handles.MaxRepLoadI_Epst,'String',sprintf('%.2f',[handles.RepLoadI*str2double(get(handles.Epstcopy,'string'))/LoadPst]));
end


function FurnaceSize_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if user_entry<=0 || user_entry>99999999
    errordlg('Value must be positive but less than 99999999.','Bad Input','modal') 
end
handles.FurnaceSize = user_entry;
set(handles.LoadPst_low,'String','');
set(handles.LoadPst_high,'String','');
set(handles.OverallPst_low,'String','');
set(handles.OverallPst_high,'String','');
set(handles.EAC_LL_PstUS,'String','');
set(handles.EAC_UL_PstUS,'String','');
set(handles.MaxFurnMW_Gpst,'String','');
set(handles.MaxFurnMW,'String','');
guidata(hObject,handles)

function HighXFurnace_Callback(hObject, eventdata, handles)
user_entry = get(hObject,'string');
number = get(hObject,'Value');
if number==1
    handles.cf1=1;
else
    handles.cf1=0.8;
end
set(handles.ReactCF,'String',handles.cf1);
set(handles.LoadPst_low,'String','');
set(handles.LoadPst_high,'String','');
set(handles.OverallPst_low,'String','');
set(handles.OverallPst_high,'String','');
set(handles.EAC_LL_PstUS,'String','');
set(handles.EAC_UL_PstUS,'String','');
set(handles.MaxFurnMW_Gpst,'String','');
set(handles.MaxFurnMW,'String','');
guidata(hObject,handles)

function FurnaceType_Callback(hObject, eventdata, handles)
user_entry = get(hObject,'string');
number = get(hObject,'Value');
if number==1
    handles.cf2=1;
else
    handles.cf2=0.5;
end
set(handles.FurnCF,'String',handles.cf2);
set(handles.LoadPst_low,'String','');
set(handles.LoadPst_high,'String','');
set(handles.OverallPst_low,'String','');
set(handles.OverallPst_high,'String','');
set(handles.EAC_LL_PstUS,'String','');
set(handles.EAC_UL_PstUS,'String','');
set(handles.MaxFurnMW_Gpst,'String','');
set(handles.MaxFurnMW,'String','');
guidata(hObject,handles)

function Compensation_Callback(hObject, eventdata, handles)
user_entry = get(hObject,'string');
number = get(hObject,'Value');
if number==1
    handles.cf3=1;
elseif number==2
    handles.cf3=0.5;
else
    handles.cf3=0.17;
end
set(handles.CompCF,'String',handles.cf3);
set(handles.LoadPst_low,'String','');
set(handles.LoadPst_high,'String','');
set(handles.OverallPst_low,'String','');
set(handles.OverallPst_high,'String','');
set(handles.EAC_LL_PstUS,'String','');
set(handles.EAC_UL_PstUS,'String','');
set(handles.MaxFurnMW_Gpst,'String','');
set(handles.MaxFurnMW,'String','');
guidata(hObject,handles)

function ReactCF_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if get(handles.HighXFurnace,'value')==1
    if user_entry~=1
        errordlg('Value out of Range','Bad Input','modal')
        user_entry = 1.0;
        set(hObject,'string','1.0')
    end
elseif get(handles.HighXFurnace,'value')==2
    if user_entry<0.8 || user_entry>1.0
        errordlg('Value out of Range','Bad Input','modal')
        if user_entry<0.8
            user_entry = 0.8;
            set(hObject,'string','0.8')
        else
            user_entry = 1.0;
            set(hObject,'string','1.0')
        end
    end
end
handles.cf1 = user_entry;
guidata(hObject,handles)


function CompCF_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if get(handles.Compensation,'value')==1
    if user_entry~=1
        errordlg('Value out of Range','Bad Input','modal')
        user_entry = 1;
        set(hObject,'string','1.0')
    end
elseif get(handles.Compensation,'value')==2
    if user_entry<0.5 || user_entry>0.7
        errordlg('Value out of Range','Bad Input','modal')
        if user_entry<0.5
            user_entry = 0.5;
            set(hObject,'string','0.5')
        else
            user_entry = 0.7;
            set(hObject,'string','0.7')
        end
    end
elseif get(handles.Compensation,'value')==3
    if user_entry<0.17 || user_entry>0.33
        errordlg('Value out of Range','Bad Input','modal')
        if user_entry<0.17
            user_entry = 0.17;
            set(hObject,'string','0.17')
        else
            user_entry = 0.33;
            set(hObject,'string','0.33')
        end
    end
end
handles.cf3 = user_entry;
guidata(hObject,handles)

function FurnCF_Callback(hObject, eventdata, handles)
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
end
if get(handles.FurnaceType,'value')==1
    if user_entry~=1
        errordlg('Value out of Range','Bad Input','modal')
        user_entry = 1;
        set(hObject,'string','1.0')
    end
elseif get(handles.FurnaceType,'value')==2
    if user_entry<0.5 || user_entry>0.75
        errordlg('Value out of Range','Bad Input','modal')
        if user_entry<0.5
            user_entry = 0.5;
            set(hObject,'string','0.5')
        else
            user_entry = 0.75;
            set(hObject,'string','0.75')
        end
    end
end
handles.cf2 = user_entry;
guidata(hObject,handles)

function LampBase_Callback(hObject, eventdata, handles)
user_entry = get(hObject,'string');
number = get(hObject,'Value');
if number==1
    handles.cf4=1.0;
elseif number==2
    handles.cf4=1.2;
end
set(handles.LoadPst_low,'String','');
set(handles.LoadPst_high,'String','');
set(handles.OverallPst_low,'String','');
set(handles.OverallPst_high,'String','');
set(handles.EAC_LL_PstUS,'String','');
set(handles.EAC_UL_PstUS,'String','');
set(handles.MaxFurnMW_Gpst,'String','');
set(handles.MaxFurnMW,'String','');
guidata(hObject,handles)

function ArcFurnLimits_Callback(hObject, eventdata, handles)
if get(handles.ArcFurnLimits,'value')==1
    set(handles.Gpstcopy2,'String',get(handles.GPstMV,'string'));
    set(handles.Epstcopy2,'String',get(handles.Epsti,'string'));
else
    set(handles.Gpstcopy2,'String',get(handles.GPstMV_UD,'string'));
    set(handles.Epstcopy2,'String',get(handles.Epsti_UD,'string'));
end
set(handles.LoadPst_low,'String','');
set(handles.LoadPst_high,'String','');
set(handles.OverallPst_low,'String','');
set(handles.OverallPst_high,'String','');
set(handles.EAC_LL_PstUS,'String','');
set(handles.EAC_UL_PstUS,'String','');
set(handles.MaxFurnMW_Gpst,'String','');
set(handles.MaxFurnMW,'String','');
guidata(hObject,handles)



function Calc3_Callback(hObject, eventdata, handles)
Kst_low = str2double(get(handles.Kst_low,'string'));
Kst_high = str2double(get(handles.Kst_high,'string'));
cf1 = handles.cf1;
cf2 = handles.cf2;
cf3 = handles.cf3;
cf4 = handles.cf4;
%check if any of the variables are -1, message which need to be adjusted
% if handles.Pst_Background==-1, msgbox('Please provide: Background flicker.','Error')
if handles.FurnaceSize==-1, msgbox('Please provide: Furnace Size.','Error')
elseif handles.SCCn3PH==-1, msgbox('Please provide: 3-Ph Short Circuit Strength.','Error')
else
    Pst_Background = handles.Pst_Background;
    FurnaceSize = handles.FurnaceSize;
    SCCn3PH = handles.SCCn3PH;
    
    LoadPst_low = Kst_low*2*FurnaceSize/SCCn3PH*cf1*cf2*cf3*cf4;
    LoadPst_high = Kst_high*2*FurnaceSize/SCCn3PH*cf1*cf2*cf3*cf4;
    OverallPst_low = (Pst_Background^handles.alpha+LoadPst_low^handles.alpha)^(1/handles.alpha);
    OverallPst_high = (Pst_Background^handles.alpha+LoadPst_high^handles.alpha)^(1/handles.alpha);
    set(handles.EAC_LL_PstUS,'String',sprintf('%.2f',[OverallPst_low*handles.TpstPCC]));
    set(handles.EAC_UL_PstUS,'String',sprintf('%.2f',[OverallPst_high*handles.TpstPCC]));

    if get(handles.ArcFurnLimits,'value')==1
        set(handles.Gpstcopy2,'String',get(handles.GPstMV,'string'));
        set(handles.Epstcopy2,'String',get(handles.Epsti,'string'));
    else
        set(handles.Gpstcopy2,'String',get(handles.GPstMV_UD,'string'));
        set(handles.Epstcopy2,'String',get(handles.Epsti_UD,'string'));
    end
    
    if LoadPst_low>str2double(get(handles.Epstcopy2,'string'))
        cellcolor='r';
    else
        cellcolor='g';
    end
    set(handles.LoadPst_low,'String',sprintf('%.2f',[LoadPst_low]),'backgroundcolor',cellcolor);
    if LoadPst_high>str2double(get(handles.Epstcopy2,'string'))
        cellcolor='r';
    else
        cellcolor='g';
    end
    set(handles.LoadPst_high,'String',sprintf('%.2f',[LoadPst_high]),'backgroundcolor',cellcolor);
    if OverallPst_low>str2double(get(handles.Gpstcopy2,'string'))
        cellcolor='r';
    else
        cellcolor='g';
    end
    set(handles.OverallPst_low,'String',sprintf('%.2f',[OverallPst_low]),'backgroundcolor',cellcolor);
    if OverallPst_high>str2double(get(handles.Gpstcopy2,'string'))
        cellcolor='r';
    else
        cellcolor='g';
    end
    set(handles.OverallPst_high,'String',sprintf('%.2f',[OverallPst_high]),'backgroundcolor',cellcolor);
    
    set(handles.MaxFurnMW_Gpst,'String',sprintf('%.2f',[handles.FurnaceSize*str2double(get(handles.Gpstcopy2,'string'))/OverallPst_low]));
    set(handles.MaxFurnMW,'String',sprintf('%.2f',[handles.FurnaceSize*str2double(get(handles.Epstcopy2,'string'))/LoadPst_low]));
end


% --- Executes on button press in RunApp.
function RunApp_Callback(hObject, eventdata, handles)
set(handles.uipanel26,'Visible','off')
set(handles.uipanel30,'Visible','on')
set(handles.uipanel11,'Visible','on')


% --- Executes on button press in CloseApp.
function CloseApp_Callback(hObject, eventdata, handles)
close


% --- Executes on button press in FlickerLimits.
function FlickerLimits_Callback(hObject, eventdata, handles)
set(handles.uipanel26,'Visible','off')
set(handles.uipanel11,'Visible','on')
set(handles.uipanel13,'Visible','off')
set(handles.uipanel27,'Visible','off')
set(handles.uipanel28,'Visible','off')
set(handles.Aboutpanel,'Visible','off')


% --- Executes on button press in Eval.
function Eval_Callback(hObject, eventdata, handles)
set(handles.uipanel11,'Visible','off')
set(handles.uipanel13,'Visible','off')
set(handles.uipanel27,'Visible','off')
set(handles.uipanel28,'Visible','on')
set(handles.Aboutpanel,'Visible','off')


% --- Executes on button press in EstFlickerRepLoad.
function EstFlickerRepLoad_Callback(hObject, eventdata, handles)
set(handles.uipanel11,'Visible','off')
set(handles.uipanel13,'Visible','on')
set(handles.uipanel27,'Visible','off')
set(handles.uipanel28,'Visible','off')
set(handles.Aboutpanel,'Visible','off')


% --- Executes on button press in EstFlickerArcFurn.
function EstFlickerArcFurn_Callback(hObject, eventdata, handles)
set(handles.uipanel11,'Visible','off')
set(handles.uipanel13,'Visible','off')
set(handles.uipanel27,'Visible','on')
set(handles.uipanel28,'Visible','off')
set(handles.Aboutpanel,'Visible','off')


% --- Executes on button press in Aboutbutton.
function Aboutbutton_Callback(hObject, eventdata, handles)
set(handles.uipanel11,'Visible','off')
set(handles.uipanel13,'Visible','off')
set(handles.uipanel27,'Visible','off')
set(handles.uipanel28,'Visible','off')
set(handles.Aboutpanel,'Visible','on')



% --- Executes on button press in ReadFileCompliance.
function ReadFileCompliance_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt','Select the PQview text file');
var1 = importdata([pathname,filename],',');

if length(var1.textdata)<1008
    msgbox('Less than 1 week of PQView Data','modal')
end

axes(handles.PstTrends)
plot(var1.data(:,1:3))
set(gca,'XTickLabel',[var1.textdata(length(var1.textdata)-length(var1.data)+1),var1.textdata(length(var1.textdata))],'XTick',[1,length(var1.data)])
xlabel('Time','fontsize',12)
ylabel('Pst','fontsize',12)
legend('Phase A','Phase B','Phase C')


axes(handles.PltTrends)
plot(var1.data(:,4:6))
set(gca,'XTickLabel',[var1.textdata(length(var1.textdata)-length(var1.data)+1),var1.textdata(length(var1.textdata))],'XTick',[1,length(var1.data)])
xlabel('Time','fontsize',12)
ylabel('Plt','fontsize',12)
legend('Phase A','Phase B','Phase C')

for ii=1:6 %size(var1.data,2)
    sorted = sort(var1.data(:,ii));
    pclte95 = sorted(round(.95*length(sorted)));
    pclte99 = sorted(round(.99*length(sorted)));
    if ii<=3
        ComplianceTable{ii,1}=sprintf('%.2f',[pclte95]);
        ComplianceTable{ii,2}=sprintf('%.2f',pclte99);
        ComplianceTable{ii,3}=sprintf('%.0f',length(sorted));
    else
        ComplianceTable{ii-3,4}=sprintf('%.2f',pclte95);
        ComplianceTable{ii-3,5}=sprintf('%.2f',pclte99);
        ComplianceTable{ii-3,6}=sprintf('%.0f',length(sorted));
    end
end
set(handles.ComplianceTable,'Data',ComplianceTable)
guidata(hObject,handles)


%-------------------------------------------------------------------------

function UpstreamVoltage_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function PCCvoltage_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_DeleteFcn(hObject, eventdata, handles)

function figure1_CreateFcn(hObject, eventdata, handles)

function SCCn3PH_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SCCn1PH_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Pst_Background_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TPstUM_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function alpha_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Si_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function St_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SLV_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function r_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function deltaVV_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SignalType_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Duration_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function FurnaceSize_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function HighXFurnace_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function FurnaceType_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Compensation_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function RepLoadChange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RepLoadChange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function TpstPCC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TpstPCC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function RepLoadI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RepLoadI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function t1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function t2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function LampBase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LampBase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function ReactCF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ReactCF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function FurnCF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FurnCF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function CompCF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CompCF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function GPstMV_UD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GPstMV_UD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function Epsti_UD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Epsti_UD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function RepLdLimits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RepLdLimits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function ArcFurnLimits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ArcFurnLimits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
