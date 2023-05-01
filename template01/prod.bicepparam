using 'main.bicep'

param param = {
  location: 'SwedenCentral'
  tags: {
    Application: 'sys'
    Environment: 'Test'
  }
  vnet: {
    addressPrefixes: [
      '10.0.0.0/20'
    ]
    subnets: [
      {
        name: 'AzureFirewallSubnet'
        addressPrefix: '10.0.0.0/25'
      }
      {
        name: 'AzureBastionSubnet'
        addressPrefix: '10.0.0.128/25'
        rules: [
          {
            name: 'nsgsr-allow-gatewaymanager-inbound'
            properties: {
              access: 'Allow'
              sourceAddressPrefix: 'GatewayManager'
              sourcePortRange: '*'
              destinationAddressPrefix: '*'
              destinationPortRange: '443'
              protocol: 'Tcp'
              priority: 100
              direction: 'Inbound'
            }
          }
          {
            name: 'nsgsr-allow-azureloadbalancer-inbound'
            properties: {
              access: 'Allow'
              sourceAddressPrefix: 'AzureLoadBalancer'
              sourcePortRange: '*'
              destinationAddressPrefix: '*'
              destinationPortRange: '443'
              protocol: 'Tcp'
              priority: 200
              direction: 'Inbound'
            }
          }
          {
            name: 'nsgsr-allow-https-inbound'
            properties: {
              access: 'Allow'
              sourceAddressPrefix: 'Internet'
              sourcePortRange: '*'
              destinationAddressPrefix: '*'
              destinationPortRange: '443'
              protocol: 'Tcp'
              priority: 300
              direction: 'Inbound'
            }
          }
          {
            name: 'nsgsr-allow-http-outbound'
            properties: {
              access: 'Allow'
              sourceAddressPrefix: '*'
              sourcePortRange: '*'
              destinationAddressPrefix: 'Internet'
              destinationPortRange: '80'
              protocol: 'Tcp'
              priority: 100
              direction: 'Outbound'
            }
          }
          {
            name: 'nsgsr-allow-https-outbound'
            properties: {
              access: 'Allow'
              sourceAddressPrefix: '*'
              sourcePortRange: '*'
              destinationAddressPrefix: 'AzureCloud'
              destinationPortRange: '443'
              protocol: 'Tcp'
              priority: 200
              direction: 'Outbound'
            }
          }
          {
            name: 'nsgsr-allow-rdp-ssh-outbound'
            properties: {
              access: 'Allow'
              sourceAddressPrefix: '*'
              sourcePortRange: '*'
              destinationAddressPrefix: 'VirtualNetwork'
              destinationPortRanges: [
                '22'
                '3389'
              ]
              protocol: 'Tcp'
              priority: 300
              direction: 'Outbound'
            }
          }
        ]
      }
      {
        name: 'GatewaySubnet'
        addressPrefix: '10.0.1.0/25'
      }
      {
        name: 'snet-mgmt'
        addressPrefix: '10.0.1.128/25'
      }
      {
        name: 'snet-web'
        addressPrefix: '10.0.2.0/25'
      }
      {
        name: 'snet-vda'
        addressPrefix: '10.0.2.128/25'
      }
    ]
  }
  vm: [
    {
      name: 'vmabc'
      tags: {
        Application: 'app'
        Service: 'srv'
      }
      vmSize: 'Standard_B2s'
      plan: {}
      imageReference: {
        publisher: 'microsoftwindowsserver'
        offer: 'windowsserver'
        sku: '2022-datacenter-smalldisk'
        version: 'latest'
      }
      osDiskSizeGB: 64
      datadisks: []
      networkInterfaces: [
        {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: '10.0.1.133'
          primary: true
          subnet: 'snet-mgmt'
          publicIPAddress: false
          enableIPForwarding: false
          enableAcceleratedNetworking: false
        }
      ]
    }
  ]
}
