Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC4F4EE18
	for <lists+cocci@lfdr.de>; Fri, 21 Jun 2019 19:46:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5LHjt6U026127;
	Fri, 21 Jun 2019 19:45:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9F076778C;
	Fri, 21 Jun 2019 19:45:55 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B5709776C
 for <cocci@systeme.lip6.fr>; Fri, 21 Jun 2019 19:45:53 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5LHjpbp008509
 for <cocci@systeme.lip6.fr>; Fri, 21 Jun 2019 19:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561139151;
 bh=sqWPgZdluR6A7BbGjmXCfrg7aV83yHwDCR9plZmmF/M=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=j4LpklI1X448aE9SQCde6AF/aGkMmjjgoRkhNwNTF0v1pNkR25esPt5FHvkDQ+vIn
 cCXs6/HmmJ/DQOjYrDqEiLW/a8aT/svIy4HFTK6jl3c6r/Kv0zZek/bVWHhenFY9At
 QaoNFbOD8fJMXDKs6L3/hXiIzG54HopwJY2JtAbQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.156.129]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MZDki-1hskew3Wai-00KygU for
 <cocci@systeme.lip6.fr>; Fri, 21 Jun 2019 19:45:50 +0200
To: Coccinelle <cocci@systeme.lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <708207db-69d7-8962-e507-cd705142d0c4@web.de>
Date: Fri, 21 Jun 2019 19:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:icv/oNaA2z0Xe2Ftn1OLQ2oddwAmNdN3xa8tIAD0/JCJfDhlLnl
 QUZwwz1y3ilN62TcqFMAJDFqntOYsSBYkKsUH6Dym9NfrhYeeg2GP8EZJmzKlabo6LXg5Wt
 Nr8WI8Qb1wrj5wMqroCqS+lIxZjnAQRMcvHT/CrfyyDq1BkaTt7iBAjckC5hkx63z+ozkx5
 N2ULMJ5PEmtwxsKRl+19Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zRpiYuw7Xl0=:YM8tsCoiA9qbLRbZ5a7nAh
 SvvrGrE1VUvgVozXTBf1DHy1Pe022yShMj4ERnnLrDvU2SmOAPo8sC2FTUtTVVyFeh52IuiI4
 N7Yybk5wHouuTAm3Be8ig79FfzcCFyKO0wHfcQ+0B394sbXgduVEBIkLBuBc9JPkXeOJRM40H
 05fkZFqAuhAAs9DIxMfwvUbhtPDt6UuOdS4xsTrF8XxJoQTkU3xkBX21CWnS7TGaf4sMAiI4W
 TPBIGq7rAXfDeeVzzlrKqem6eOs0upMSIK/I1uL7jXoaCS7nCWL+2Qo4RuC1BFNhZZGsypDyn
 5b6kqo+fkgOpOq1R/HKqB8vZftUXoctjGGz51UA42mR4CxPjdzgu8BbPREUzM2LJIzaR1s27h
 btQkcIrI0Dfb8YDO8w2NPDN3EIAGrSTB0JWjlcY7aGdzIT4p48QlTUbfYttBb9Lt9w8OrBtgh
 t6KfPeH8kfHthtn60MfnodQaXyP1bd11JPlqOq9arSudeOvv/q3NMJ+yWH229AeU+pxnGFRfx
 IXBO4Cof+GMwo61/d/fo14IgdKPse95vIj4LhvCS9AGgcWRdoDzuHlDhpmcZ0fhp0vZ7I09bB
 jDSfKxEJn7yqq6lK9hEeApv2FCNAyH+oXppgng3v0BzT5QAX2c807tLzI6CeIS+y9Th9NqnL9
 gGaVy9xuNHMXGMnUB0QDGEe9JKX5RNAdNhunR1cRPaqfylsS6gpKXyTye91I466ntkXCzk/7g
 GkREYhiQd0iVHn03Sjl0Yp60U1eaROi2+68RHolr7D6R9/E76RG+CyL0Fgk8JqIYFxhN1qMVg
 z7WRAA7G+x8zk1HLbYA/ClzULE2d83332q5NqFS8D7Dp9f7mxzviF2At2trvNy81RvkNu9TNk
 5nNkKZsKMuGlO/uPMxglSRYSB222Ol5E/n+x8vClDUKBULN9qW8ejcA2vAUN+dSlXEy7ckZxA
 J9vrIKJ+tq++Yu0OtrWZ5KVS4mBFpnyPv/sBadJaezc/5HOQnNa1k
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 21 Jun 2019 19:45:57 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 21 Jun 2019 19:45:52 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Moving exception handling code to the end of a function
 implementation with SmPL?
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

SGVsbG8sCgpJIGJlY2FtZSBpbnRlcmVzdGVkIGluIGFub3RoZXIgc291cmNlIGNvZGUgdHJhbnNm
b3JtYXRpb24gYWdhaW4uCkkgd291bGQgbGlrZSB0byBtb3ZlIGEgYml0IG9mIGNvbW1vbiBjb2Rl
IHRvIHRoZSBlbmQgb2YgYSBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbgp3aXRoIHRoZSBoZWxwIG9m
IHRoZSBmb2xsb3dpbmcgc2NyaXB0IGZvciB0aGUgc2VtYW50aWMgcGF0Y2ggbGFuZ3VhZ2UuCgoK
QHJlcGxhY2VtZW50QApleHByZXNzaW9uIGluZm8sIHJlc3VsdDsKaWRlbnRpZmllciB0YXJnZXQs
IHdvcms7CnR5cGUgdCAhPSB2b2lkOwpAQAogdCB3b3JrKC4uLikKIHsKIDwrLi4uCiBpZiAoLi4u
KQooCi17Ci1yZXN1bHQgPSBpbmZvOwogZ290bwotICAgICB0YXJnZXQKKyAgICAgZV9ub2Rldgog
OwotfQp8CiB7CiAuLi4KLXJlc3VsdCA9IGluZm87CiBnb3RvCi0gICAgIHRhcmdldAorICAgICBl
X25vZGV2CiA7CiB9CikKIC4uLis+CnRhcmdldDoKIC4uLgogcmV0dXJuIHJlc3VsdDsKK2Vfbm9k
ZXY6CityZXN1bHQgPSBpbmZvOworZ290byB0YXJnZXQ7CiB9CgoKVGhlIGltcGxlbWVudGF0aW9u
IG9mIHRoZSBmdW5jdGlvbiDigJxtZWdhc2FzX21nbXRfaW9jdGxfZnfigJ0gbG9va3MgbGlrZQph
biB1cGRhdGUgY2FuZGlkYXRlLgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL3Njc2kvbWVnYXJhaWQv
bWVnYXJhaWRfc2FzX2Jhc2UuYz9pZD00YWUwMDRhOWJjYThiZWYxMThjMmI0ZTc2ZWUzMWM3ZGY0
NTE0ZjE4I243NzQyCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjItcmM1L3Nv
dXJjZS9kcml2ZXJzL3Njc2kvbWVnYXJhaWQvbWVnYXJhaWRfc2FzX2Jhc2UuYyNMNzc0MgoKKiBJ
IGV4dHJhY3RlZCBpdCBpbnRvIGEgdGVzdCBzb3VyY2UgZmlsZS4KICBVbmZvcnR1bmF0ZWx5LCBJ
IHN0dW1ibGUgb24gdGhlIGVycm9yIG1lc3NhZ2Ug4oCccmVwbGFjZW1lbnQ6IGFscmVhZHkgdGFn
Z2VkIHRva2VuOgogIEMgY29kZSBjb250ZXh04oCdIHRoZW4uCgoqIElmIEkgZGVsZXRlIGEgYml0
IG1vcmUgc291cmNlIGNvZGUgZm9yIHRoaXMgZXhhbXBsZSwgdGhlIHNob3duIHRyYW5zZm9ybWF0
aW9uCiAgYXBwcm9hY2ggY2FuIHdvcmsgYXMgZXhwZWN0ZWQuCgoqIFRoZSBjb21wbGV0ZSBzb3Vy
Y2UgZmlsZSBzZWVtcyB0byBiZSB2ZXJ5IGNoYWxsZW5naW5nIGZvciB0ZXN0aW5nCiAgdGhlIHJ1
biB0aW1lIGNoYXJhY3RlcmlzdGljcy4KCgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kgbWFpbGluZyBsaXN0CkNvY2Np
QHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5mci9tYWlsbWFuL2xpc3RpbmZv
L2NvY2NpCg==
