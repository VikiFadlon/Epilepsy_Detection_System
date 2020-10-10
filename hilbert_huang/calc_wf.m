
function [wf] = calc_wf(signal,imf_num)
   wf = zeros(imf_num,1);
   imfs = emd(signal,'Display',0,'MaxNumIMF',imf_num);
   for j=1:imf_num
       sig = hilbert(imfs(:,j));
       IA = abs(sig);
       % compute instantaneous frequency using phase angle
       phaseAngle = angle(sig);
       IF = abs(gradient(unwrap(phaseAngle)))/(2*pi);
       wf(j) = sum((IF.^2).*IA)/sum(IF.*IA);
   end
end