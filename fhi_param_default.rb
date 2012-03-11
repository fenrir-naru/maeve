# ����A�b�v�����N��Ruby�Ȃ̂� Math::sqrt�Ȃǂ��g���邪
# FHI�v���O�����ł̏����Ǎ��ł͏�Z�̂ݑΉ��ŁA+-/���疢�����Ȃ̂�
# ��Z�݂̂Őݒ肷�鎖�B
# �Q�C���ݒ��100�J�����𒴂��Ȃ����ƁB
# ������ꍇ��FHI_main��Chbuf[100]�𑝂₷���ƁB
# [ �̑O�܂ł̏��Ԃ͕ύX�B2��ȏ�̐ݒ�͉��̒l�ɏ㏑�������B
# �Q�C���ݒ���� 2011.1.20 17:17

    KItheta         = 0.2592            #00 PID KthetaI
    Ktheta          = 0.1536            #01 PID Ktheta
    Kq_theta        = 0.0090            #02 PID Kq_theta
    KIphi           = 0.6487            #03 PID KphiI
    Kphi            = 0.1058            #04 PID Kphi
    Kdp             = 0.0018            #05 PID Kp
    KBdot           = 0.3656 * 0.25     #06 PID KBdot
    KAy             = 0.0000            #07 PID KAy
    KIAy            = 0.0920            #08 PID KAyI
    fflag_DINN      = 1                 #09 1=>DI+NN 0=> PID
    dKomegaPhi      = 9.26 * 0.65       #10 DI dKPhi   ��r  = 32.4rad/s 9.26rad/s?
    dKomegaTheta    = 9.47 * 0.4 * 1.2  #11 DI dKTheta ��sp = 26.1rad/s 9.47rad/s?
    dKomegaBeta     = 5.32 * 0.1 * 5.0  #12 DI dKBeta  ��nd = 10.1rad/s 5.32rad/s?
    dZetaPhi        = 1.0               #13 DI ��Phi
    dZetaTheta      = 1.0               #14 DI ��Theta
    dZetaBeta       = 1.0               #15 DI ��Beta 
    dNN_Gamma_W     = 0.02              #23 NN GAMMA_W �o�͑��w�K�Q�C��
    dNN_Gamma_V     = 0.7               #24 NN GAMMA_V ���͑��w�K�Q�C��
    dNN_Kr0         = 0.01              #25 Kr0 ���o�X�g�� Org

    dKP_EAS         = 12    #*1.5       #26 EAS Kp
    dKI_EAS         = 0.06  #*0.7       #27 EAS KI

    dBW             = 1.0#0.2           #28 NN�o�͑��o�C�A�X��dBW
    dBV             = 1.0#0.8           #29 NN���͑��o�C�A�X��dBV
    dNNlambda       = 0.5               #20 NN lambda

    dNN_KomegaPhi   = dKomegaPhi        #16 NN dKPhi 
    dNN_KomegaTheta = dKomegaTheta      #17 NN dKTheta
    dNN_KomegaBeta  = dKomegaBeta       #18 NN dKBeta
    dNN_ZetaPhi     = dZetaPhi          #19 NN zeta Phi
    dNN_ZetaTheta   = dZetaTheta        #21 NN zeta Theta
    dNN_ZetaBeta    = dZetaBeta         #22 NN zeta Beta

#    dCGSTA	        = 686.4             #30 CGSTA[mm] +20mm
    dCGSTA	        = 666.4             #30 CGSTA[mm] Nominal
#    dCGSTA	        = 626.4             #30 CGSTA[mm] -40mm
#    dCGSTA	        = 646.4             #30 CGSTA[mm] -20mm
#    dCGSTA	        = 616.4             #30 CGSTA[mm] -50mm
    dCGBL	        = 0.0               #31 CGBL[mm]
    dCGWL	        = 0.0               #32 CGWL[mm]
    #    dIxx	        =  0.0781            #33 Ixx[kgm2] �������v���l
    #    dIyy	        =  0.234             #34 Iyy[kgm2] �������v���l
    #    dIzz	        =  0.287             #35 Izz[kgm2] �������v���l
    #    dIxz           =  0.0660            #36 Ixz[kgm2] �������v���l
    dIxx	        = 0.133             #33 Ixx[kgm2] ���Z�l
    dIyy	        = 0.342             #34 Iyy[kgm2] ���Z�l
    dIzz	        = 0.433             #35 Izz[kgm2] ���Z�l
    dIxz            = 0.065             #36 Ixz[kgm2] ���Z�l
    dWeight         = 3.02              #37 weight[kg] �v���l@�����
    fNNflag         = 1.0               #38 NNflag 0:DI�P��, 1:DI+NN
[
    KItheta,        #00 PID KthetaI
    Ktheta,         #01 PID Ktheta
    Kq_theta,       #02 PID Kq_theta
    KIphi,          #03 PID KphiI
    Kphi,           #04 PID Kphi
    Kdp,            #05 PID Kp
    KBdot,          #06 PID KBdot
    KAy,            #07 PID KAy
    KIAy,           #08 PID KAyI
    fflag_DINN,     #09 1=>DI+NN 0=> PID
    dKomegaPhi,     #10 DI dKPhi 
    dKomegaTheta,   #11 DI dKTheta
    dKomegaBeta,    #12 DI dKBeta
    dZetaPhi,       #13 DI zeta Phi
    dZetaTheta,     #14 DI zeta Theta
    dZetaBeta,      #15 DI zeta Beta
    dNN_KomegaPhi,  #16 NN dKPhi 
    dNN_KomegaTheta,#17 NN dKTheta
    dNN_KomegaBeta, #18 NN dKBeta
    dNN_ZetaPhi,    #19 NN zeta Phi
    dNNlambda,      #20 ramda
    dNN_ZetaTheta,  #21 NN zeta Theta
    dNN_ZetaBeta,   #22 NN zeta Beta
    dNN_Gamma_W,    #23 NN GAMMA_W
    dNN_Gamma_V,    #24 NN GAMMA_V
    dNN_Kr0,        #25 Kr0
    dKP_EAS,        #26 EAS Kp
    dKI_EAS,        #27 EAS KI
    dBW,            #28 dBW
    dBV,            #29 dBV
    dCGSTA,         #30 CGSTA[mm]
    dCGBL,          #31 CGBL[mm]
    dCGWL,          #32 CGWL[mm]
    dIxx,           #33 Ixx[kgm2]
    dIyy,           #34 Iyy[kgm2]
    dIzz,           #35 Izz[kgm2]
    dIxz,           #36 Ixz[kgm2]
    dWeight,        #37 weight[kg]
    fNNflag         #38 NNflag 0:DI�P��, 1:DI+NN
]

