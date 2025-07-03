Name:       flutter_pty
Summary:    flutter_pty
Version:    1.0.0
Release:    1
Group:      N/A
License:    MIT
Source0:    %{name}-%{version}.tar.gz
Source1:    %{name}.manifest

BuildRequires:  make
BuildRequires:  cmake

%define usrlib /usr/lib

%description
%{summary}

%prep
%setup -q
cp %{SOURCE1} .

%build
cd src
cmake .
make

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/%{usrlib}
cp ./src/libflutter_pty.so  %{buildroot}/%{usrlib}/

%post

%files
%manifest %{name}.manifest
%defattr(-,root,root,-)
%{usrlib}/*
