Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 747731F06E5
	for <lists+cocci@lfdr.de>; Sat,  6 Jun 2020 16:05:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 056E4xjq010768;
	Sat, 6 Jun 2020 16:04:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E28793BAB;
	Sat,  6 Jun 2020 16:04:58 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8994C3BAB
 for <cocci@systeme.lip6.fr>; Sat,  6 Jun 2020 16:04:57 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 056E4uXd001863
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 6 Jun 2020 16:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591452291;
 bh=unGkSxvmUQrT+JNXkctYfcWReOw/mcpQ1B8NofFQUog=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=Y9pEUeC3fFr3HwPJpovbsSjZA2VHG3BYoaDRzrg6uAJ9C6aiuqcXe3Udyke28vLW0
 aGzne9469EtCloyu4mRdJqf3F+TCQvyeTaDH+mxFz/RaCiC8GnoFEjaQHAitg9L66F
 pK7v+XPGGQDRQY+5zkIWwTvmuUiAvtVJkmFeWQhI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.40.239]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LeLin-1jBFyY2fsL-00qEj3; Sat, 06
 Jun 2020 16:04:51 +0200
From: Markus Elfring <Markus.Elfring@web.de>
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <119d91fd-1ad0-8842-10eb-ee8fa16da1b0@web.de>
Date: Sat, 6 Jun 2020 16:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:fN15pfZJlffXWQW5Lq8rwpPpeT0sxSGN8X/MkP+DExoX3q0VrYZ
 Wsts1djrTn5oidCUJrgt+VpAmbKuKfXJ8+irHncb7gWgf1xOFLPFm4gusikOULwKX0UK/si
 s6Y9AA58HkQ/MNPJRCnFt8FRcP4dTyUjUKmqOoVhyowKM3j7uv3TLP46jhKDmBWxsfd8uIZ
 g8otOytwVIWRrNm+fMNXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ud7vUW+1vTE=:2yTpJHuoee3llDYqeOPo+N
 kFBI5tD7tbCxI0z+4Yj0JSIDq60G9Nm04P7W/vx659ZMiowAAWRhGI/K8kpb4n7qu9YGzDSyb
 IjmWQuHaxgqSaELWxVSMyrbAP2hynD246teLlB3TyrNUVdRnH1nBzs6hU8wgqOhSNrf8XozK9
 LvTLBUBc9SQxBChAV3mX3Y9M4FQ3Inq48h6nsA7eoSrq7Uk+GQLAKgshWX3z/1OLiV3gf7dTa
 orfSbdSWKzF0ckJj/BV1rGIA+sekYgPvP2lnWzO8tl4aKOFahzcvqVPpEpFeWJhLaXBOLcNw6
 AlwBiX6J4eb7bQAdWbU03dYObY/3erqSFVj+80TDAUW/tz47sgixTJLQ+wA5N8eLBVcfUq9I3
 9eQTFCR02RHGMRN6cqcf9ha8D9s1/Qw/e+4A+SumC9qU8ijzfbyfj2fhofpluyAXgLEhTk5CF
 kuDluf4lMmgvHxua8PzZSluHPxLJPihbKSM5DmVM6jzElaAeo3eVAoiBUxww+EeaeeXJZ25CH
 WnB/CQvATYhe+NTwhoWoZHXpcWBC6QB5DHqNTgQZZwGhDVURP9gomrxfBW8gAui46nCRqnqln
 4p6yAfRUTDai2BSDjPHaqlvDD6cXVFB2ufmzwKS1ryNlWLi5bGDiYkzLKgv6/B1JBseWizcX3
 mB6dh8Yn7ZZLIuwq+iEE+6wTeiPSTO22e+TZsUGpNQEN6csVWoE2fhLeziPby/nqj+2Wp/ygN
 llFmpA+sCAaatbHGWYDImMGUXmtUnzKhWKQyFiQw9ifNigI/ao5dgWzQ9GGxG9RUlWMVpmn/O
 qIsQDc3twkivGemg8JAzJcCOSXZAUdIQvEVbVYp6bFSlBoJ1EzQ/SOGoMvuB3OtcO5AGlDEG4
 56JMSSQXq3DRauK9VC8Bnhw2rn+sGSH4keRsiMewZ4JfZ0ZzUjbB27wPYy5mllu3+wy7n1nMa
 gwp/DLqBm8vn4kwbAvtX9W2YFybr2QbgFDGZHyX+Wax5O+5NmMU3IjP2qwdmPJE4Ss4iv/0kH
 79+vzCLmBkKbWUYMMGSs6ceWbiNI2jIo7TXWk7kLFVUiE6a/Arp6zLHGiyHZJSybiEbnind7V
 84/B9nZKrD8qME3hODMsC/yMfl8KRmOczaE+dgLF38Sb613IY1XZeY6XbtLcij1gbizAYkYEm
 Ulxj7dJ55a0eHkLx6h+oDU9S3O48R8LbnS7qnlx/DP8gajklbEcoWhbDFDCdYHuzHDq3lkh2H
 jNWDcfIfcSoqVw7gL
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 16:04:59 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 16:04:57 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: api: add kvfree script
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

PiArQGNob2ljZUAKPiArZXhwcmVzc2lvbiBFLCBFMTsKPiArcG9zaXRpb24ga29rLCB2b2s7Cj4g
K0BACj4gKwo+ICsoCj4gKyAgaWYgKC4uLikgewo+ICsgICAgLi4uCj4gKyAgICBFID0gXChrbWFs
bG9jQGtva1x84oCmXCkoLi4uKQoKRnVydGhlciBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzIGZyb20g
dGhpcyBTbVBMIHNjcmlwdCBjYXVnaHQgbXkgc29mdHdhcmUKZGV2ZWxvcG1lbnQgYXR0ZW50aW9u
LgoKKiBJcyB0aGVyZSBhIG5lZWQgdG8gYWRkIHRoZSBzcGVjaWZpY2F0aW9uIOKAnHdoZW4gYW55
4oCdIHRvIHRoZSBTbVBMIGVsbGlwc2VzCiAgYmVmb3JlIHN1Y2ggYXNzaWdubWVudCBzdGF0ZW1l
bnRzPwoKKiBBIGxpbWl0ZWQgc2VhcmNoIGFwcHJvYWNoIHdhcyBleHByZXNzZWQuIFdpbGwgYWRk
aXRpb25hbCBzb3VyY2UgY29kZSB2YXJpYXRpb25zCiAgYmVjb21lIHJlbGV2YW50PwogICsgc3dp
dGNoIHN0YXRlbWVudAogICsgaWYgYnJhbmNoZXMgd2l0aCBzaW5nbGUgc3RhdGVtZW50cwogICsg
Y29uZGl0aW9uYWwgb3BlcmF0b3IKCgo+ICtAb3Bwb3J0dW5pdHkgZGVwZW5kcyBvbiAhcGF0Y2gg
4oCmQArigKYKPiArICBFID0gXChrbWFsbG9jXHzigKZcKSguLi4sIHNpemUsIC4uLikKPiArICAu
Li4gd2hlbiAhPSBFID0gRTEKPiArICAgICAgd2hlbiAhPSBzaXplID0gRTEKCkkgd29uZGVyIHRo
YXQgdHdvIGFzc2lnbm1lbnRzIHNob3VsZCBiZSBleGNsdWRlZCBoZXJlIGFjY29yZGluZyB0bwp0
aGUgc2FtZSBleHByZXNzaW9uIG1ldGF2YXJpYWJsZS4KCgorQHBrZnJlZSBkZXBlbmRzIG9uIHBh
dGNoIGV4aXN0c0AK4oCmCistIFwoa2ZyZWVcfGt2ZnJlZVwpKEUpCisrIHZmcmVlKEUpCgpXb3Vs
ZCB5b3UgbGlrZSB0byB1c2UgYSBTbVBMIGNvZGUgdmFyaWFudCBsaWtlIHRoZSBmb2xsb3dpbmcK
YXQgYW55IG1vcmUgcGxhY2VzPwooSXMgaXQgb2NjYXNpb25hbGx5IGhlbHBmdWwgdG8gaW5jcmVh
c2UgdGhlIGNoYW5nZSBwcmVjaXNpb24/KQoKKy1cKGtmcmVlXHxrdmZyZWVcKQorK3ZmcmVlCisg
ICAgICAoRSkKCgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQ29jY2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5m
cgpodHRwczovL3N5c3RlbWUubGlwNi5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
