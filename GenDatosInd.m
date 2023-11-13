define_constants;
Base = loadcase('case118');
Demanda = Base.bus(:,PD);
dem_MonteCarlo = zeros(1,size(Demanda,1))
for i=1:1:size(Demanda,1)
    dem_MonteCarlo(i) = unifrnd(Demanda(i)*0.5,Demanda(i)*1.5);
    Base.bus(i, PD) = dem_MonteCarlo(i);
end
result = runopf(Base);
LMP = result.bus(:,LAM_P)

Salida = [dem_MonteCarlo, LMP']
csvwrite ('datasetInd.csv', Salida)