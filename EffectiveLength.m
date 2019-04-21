function eff = EffectiveLength(theta, PanelLength, BlockerLength)

%In this reference frame, theta is 0 at the blocker, and is positive moving
%   across the panel.

theta = mod(theta, 2*pi); %normalise theta
if (theta > (7*pi / 4)) 
  delta = 2*pi - theta;
  BlockedLength = (sin(delta) * BlockerLength) / (sin(pi/4 - delta))
  if (BlockedLength >= PanelLength)
    EffectiveLength = 0;
  else
    EffectiveLength = PanelLength - BlockedLength;
  end
  eff = sin(theta + (pi / 4)) * EffectiveLength;
elseif (theta < (3 * pi / 4))
    eff = sin(theta + (pi / 4)) * PanelLength;
else
    eff = 0;
end

