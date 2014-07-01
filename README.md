# nodechef-cookbook

Setup Node.js server with few global packages and MongoDB

## Supported Platforms

Ubuntu
Debian

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['hostname']</tt></td>
    <td>String</td>
    <td>External Hostname of the server, usually, top level domain</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['set_fqdn']</tt></td>
    <td>String</td>
    <td>Hostname of the particular server</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['public_keys']</tt></td>
    <td>Array of Strings</td>
    <td>Public keys allowed to access the server</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['known_hosts']</tt></td>
    <td>Array of Strings</td>
    <td>List of urls added to known hosts</td>
    <td><tt>['github.com']</tt></td>
  </tr>
  <tr>
    <td><tt>['ssmtp']</tt></td>
    <td>Hash of values</td>
    <td>SMTP configuration, see attributes/default.rb</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td colspan="4">App Server</td>
  </tr>
  <tr>
    <td><tt>['project_name']</tt></td>
    <td>String</td>
    <td>Short name of the project. Used to name main directory.</td>
    <td><tt>node</tt></td>
  </tr>
  <tr>
    <td><tt>['git']['repository']</tt></td>
    <td>String</td>
    <td>Git url to repository to clone</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['git']['deploy_public_key']</tt></td>
    <td>String</td>
    <td>Public key used for deployments</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['git']['deploy_private_key']</tt></td>
    <td>String</td>
    <td>Private key used for deployments</td>
    <td><tt></tt></td>
  </tr>
</table>

## Usage

### nodechef::default

Include `nodechef` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[nodechef::default]"
  ]
}
```

Application Server:

```json
{
  "run_list": [
    "recipe[nodechef::app]"
  ]
}
```

Database Server:

```json
{
  "run_list": [
    "recipe[nodechef::db]"
  ]
}
```

All-in-One:
```json
{
  "run_list": [
    "recipe[nodechef::db]"
    "recipe[nodechef::app]"
  ]
}
```

