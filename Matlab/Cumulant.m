function y = Cumulant(Sig)
    modulationPool = {'4psk' '8psk' '16qam' '64qam'};
    C20 = mean(Sig.^2);
    C21 = mean(abs(Sig).^2);
    M40 = mean(Sig.^4);
    C40 = M40 - 3*C20^2;
%     C41 = mean(Sig.^3.*conj(Sig)) - 3*C20*C21;
    C42 = mean(abs(Sig).^4) - abs(C20)^2 - 2*C21^2;
%     C60 = mean(Sig.^6) - 15*C20*M40 + 30*C20^3;
%     C63 = mean(Sig.^3.*conj(Sig).^3) - 9*C42*C21 - 6*C21^3;
    C63 = mean(abs(Sig).^6) - 9*mean(abs(Sig).^4)*C21 + 12*(abs(C20)^2)*C21 + 12*C21^3;
%     cumu = [C40/(C21^2) C41/(C21^2) C42/(C21^2)  C63/(C21^2)];
%     cumu = [C20/C21 C21/C21 C40/(C21^2) C41/(C21^2) C42/(C21^2)];
%     cumu = [C40/(C21^2) C41/(C21^2) C42/(C21^2) C60 C63];
%     cumu = [C40/(C21^2) C42/(C21^2)];
    cumu = [C63];
%     cumu = [C40/(C21^2) C42/(C21^2) C63];
%     cumu = [C20 C21 C40/(C21^2) C41/(C21^2) C42/(C21^2)];
%     cumu = [C40/(C21^2) C42/(C21^2)  C63/(C21^3)];
%     cumu = [C20 C21 C40 C41 C42]
%     cumu_ref = [1 0 -1 4;0 0 -1 4;-0.68 0 -0.68 2.08;-0.6191 0 -0.6191 1.79];
%     cumu_ref = [0 1 1 0 -1; 0 1 0 0 -1; 0 1 -0.68 0 -0.68; 0 1 -0.6191 0 -0.6191];
%     cumu_ref = [1 0 -1 0 4; 0 0 -1 0 4; -0.68 0 -0.68 0 2.08; -0.6191 0 -0.6191 0 1.79];
%     cumu_ref = [1 -1; 0 -1; -0.68 -0.68; -0.6191 -0.6191];
    cumu_ref = [4; 4; 2.08; 1.79];
%     cumu_ref = [1 -1 4; 0 -1 4; -0.68 -0.68 2.08; -0.6191 -0.6191 1.79];
%     cumu_ref = [1 -1 4; 0 -1 4; -0.68 -0.68 2.08; -0.6191 -0.6191 1.797];
%     cumu_ref = [0 1 1 0 -1 4; 0 1 0 0 -1 4; 0 1 -0.68 0 -0.68 2.08; 0 1 -0.6191 0 -0.6191 1.8];
%     cumu_ref = [0 2 4 0 -4; 0 2 0 0 -4; 0 1.12 -0.85 0 -0.85; 0 0.85 -0.44 0 -0.44];
    err = abs(real(cumu-cumu_ref));
    err = sum(err');
    [A I] =  min(err);
    y = modulationPool{I};
end