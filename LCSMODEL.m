function [v_mod] = LCSMODEL(r,d,l,theta,w)

B = asin((d-r*sin(theta))/l);
w_bar = (w*r*cos(theta))./(l.*cos(B));
pos = -l.*cos(B)+r*cos(theta);
v_mod = -(l.*w_bar.*sin(B)) - (r*w*sin(theta));
end