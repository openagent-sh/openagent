
# Network

Configure proxies and custom certificates.

OpenCode supports standard proxy environment variables and custom certificates for enterprise network environments.

---

## [Proxy](https://opencode.ai/docs/network/#proxy)

OpenCode respects standard proxy environment variables.

Terminal window

```
# HTTPS proxy (recommended)export HTTPS_PROXY=https://proxy.example.com:8080
# HTTP proxy (if HTTPS not available)export HTTP_PROXY=http://proxy.example.com:8080
# Bypass proxy for local server (required)export NO_PROXY=localhost,127.0.0.1
```

Caution

The TUI communicates with a local HTTP server. You must bypass the proxy for this connection to prevent routing loops.

You can configure the server’s port and hostname using [CLI flags](https://opencode.ai/docs/cli#run).

---

### [Authenticate](https://opencode.ai/docs/network/#authenticate)

If your proxy requires basic authentication, include credentials in the URL.

Terminal window

```
export HTTPS_PROXY=http://username:password@proxy.example.com:8080
```

Caution

Avoid hardcoding passwords. Use environment variables or secure credential storage.

For proxies requiring advanced authentication like NTLM or Kerberos, consider using an LLM Gateway that supports your authentication method.

---

## [Custom certificates](https://opencode.ai/docs/network/#custom-certificates)

If your enterprise uses custom CAs for HTTPS connections, configure OpenCode to trust them.

Terminal window

```
export NODE_EXTRA_CA_CERTS=/path/to/ca-cert.pem
```

This works for both proxy connections and direct API access.