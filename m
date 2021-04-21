Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2661366993
	for <lists+cocci@lfdr.de>; Wed, 21 Apr 2021 12:58:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 13LAw4wI017957;
	Wed, 21 Apr 2021 12:58:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4AAC677F3;
	Wed, 21 Apr 2021 12:58:04 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0F20E3E3B
 for <cocci@systeme.lip6.fr>; Wed, 21 Apr 2021 12:58:03 +0200 (CEST)
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:44a])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 13LAvwVF005660
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 21 Apr 2021 12:57:58 +0200 (CEST)
Received: by mail-wr1-x44a.google.com with SMTP id
 t14-20020a5d6a4e0000b029010277dcae0fso12430739wrw.22
 for <cocci@systeme.lip6.fr>; Wed, 21 Apr 2021 03:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=DRJ0jZ+uic29P4687jNAhPFnxQTxro7n99JItio972E=;
 b=hJCYwg2fPgsRZIwE/aRThBzJe5h9vmitnkSLzh0wa7B3A+gt1jtAir/car9QwCVUv6
 iU2e+Kp9YGvmbhoHhTnbvRitBKncDe47hG3zCUwSupiktO3R7CAhr4GnrOyQB9MdZVt5
 QJkuK5mDheVY9Ek45xfFv3A/JOr267wBIo8swebsC+W4HxtlA7bDje6bX2CcEa2Fjdie
 FM5TpIvbKuzbSlzU9Hbby9qOa8Oeb+nmwyv7VVZRKQaaAcWoXr44CM72IRDs88NDP6nU
 IINb2MLJH7c/oUoJs8HR0MxGNExaYduAVtLx/Z2k6opbvSZZzYBzIjd1vgB644nzr2A5
 L+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=DRJ0jZ+uic29P4687jNAhPFnxQTxro7n99JItio972E=;
 b=JgBH2HAjZWtfUcr3j1UisJAwInvsi1NZ4ulw9rdYvFmdflTmTjXPc5mr3zgVs/Gf4d
 E4uDPC0IR9emCZ8NsFtwk/E1CTNEYq+Bt/h7tf1/BxskLMSAfM92Tzv5FymvrvhJ4MPD
 8Yc08CIZe5mK+eAY9aFE7BlV8pQiVPZ1c2Br9jldrlLMRb36lD3UHf20Wxthd3RBKNbX
 tw7dvuH0gHkGXLlcCFVE3iojyzUqxlIbNYWKbaxSLBLQQwFyN0byUvRVoWpxNZbYVvnU
 Mh4QikIs8zqMO1ZKwyhRDO6+StIMQHs+F90lNNrQ/cyuwF+gL8DYLEswbTt4XaV9BTnp
 Nj2w==
X-Gm-Message-State: AOAM530yXiGtb2vGKpQwHlLYis4wk4ZF+R4AIQFHWDq+R2XqBRdbcyAy
 FsMZhV+U0n9QlymdM61xU9MuVOhgDv6V8gyiSTNd/+ffAIluQXfi/8cTGIrnwUQo/gqnkfx62T/
 1LPAQZoKlKmhY1+3zjtiz+sihCFbk2bzZ0MUyvvRiXOEWZkYUNKle8OkT/w==
X-Google-Smtp-Source: ABdhPJxCLqk/Eg7HP4Ugn504t6ibukzSo3TD5ZdfxuqTW/O+vOkgvsNNNnrlbsDT8WOrJI7MIK9fW1GRvw==
X-Received: from tabba.c.googlers.com ([fda3:e722:ac3:10:28:9cb1:c0a8:482])
 (user=tabba job=sendgmr) by 2002:adf:f308:: with SMTP id
 i8mr26615216wro.209.1619002677961; 
 Wed, 21 Apr 2021 03:57:57 -0700 (PDT)
Date: Wed, 21 Apr 2021 11:57:56 +0100
Message-Id: <20210421105756.3430220-1-tabba@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
From: Fuad Tabba <tabba@google.com>
To: cocci@systeme.lip6.fr
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 21 Apr 2021 12:58:08 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 21 Apr 2021 12:57:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH] Fix parse error in presence of symbols named far
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

SGksCgpJIGp1c3Qgc3RhcnRlZCB1c2luZyBDb2NjaW5lbGxlIHllc3RlcmRheSwgYW5kIEkgY2Fu
IGFscmVhZHkgc2VlCml0IHNhdmluZyBtZSBhIGxvdCBvZiB0aW1lIGFuZCBhZ29ueS4gVGhhbmsg
eW91LgoKSSByYW4gaW50byBhIHByb2JsZW0sIGFuZCBJIHRoaW5rIHRoYXQgdGhpcyBwYXRjaCBt
aWdodCBmaXggaXQsCmhvcGVmdWxseSB3aXRob3V0IGNhdXNpbmcgb3RoZXIgcHJvYmxlbXMuIEkg
ZGlkIHNvbWUgc2FuaXR5CmNoZWNraW5nIG9uIG15IGtlcm5lbCB0cmVlLCBhbmQgaXQgc2VlbXMg
dG8gYmUgZmluZS4KClRoZXJlIGFyZSBxdWl0ZSBhIGZldyB2YXJpYWJsZXMgbmFtZWQgImZhciIg
aW4gdGhlIGtlcm5lbCwgZS5nLiwKYXJjaC9hcm02NC9rdm0vaW5qZWN0X2ZhdWx0LmMuIENvY2Np
bmVsbGUgaGFzIHNwZWNpYWwgdHJlYXRtZW50CmZvciAiZmFyIiBhcyBiZWluZyBsaW5rYWdlIHJl
bGF0ZWQsIHdoaWNoIGNhdXNlcyBwYXJzZSBlcnJvcnMgaW4KdGhlaXIgcHJlc2VuY2UuIEkndmUg
Z3JlcHBlZCBmb3IgImZhciIgaW4gdGhlIGtlcm5lbCB0cmVlLCBhbmQKaGF2ZW4ndCBub3RpY2Vk
IHdoZXJlIGl0J3MgdXNlZCBsaWtlIHRoYXQsIGJ1dCBJIGNvdWxkIGhhdmUKbWlzc2VkIGl0LgoK
VG8gcmVwcm9kdWNlOgoKY2F0ID4gdGVzdC5jIDw8IEVPRgppbnQgbWFpbih2b2lkKQp7CsKgIMKg
IMKgIMKgIGludCBmYXIgPSAwOwrCoCDCoCDCoCDCoCBpbnQgeDsKwqAgwqAgwqAgwqAgeCA9IDEw
OwrCoCDCoCDCoCDCoCByZXR1cm4geDsKfQpFT0YKCmNhdCA+IHRlc3QuY29jY2kgPDwgRU9GCkBA
CmlkZW50aWZpZXIgeDsKQEAKLSB4CisgeQpFT0YKCnNwYXRjaCAtLXNwLWZpbGUgdGVzdC5jb2Nj
aSB0ZXN0LmMgLS1kZWJ1ZyAtLXZlcmJvc2UtcGFyc2luZwoKU2lnbmVkLW9mZi1ieTogRnVhZCBU
YWJiYSA8dGFiYmFAZ29vZ2xlLmNvbT4KLS0tCiBzY3JpcHRzL2NvY2NpY2hlY2svY29jY2kvbm90
YW5kLmggfCAxIC0KIHN0YW5kYXJkLmggICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvY29jY2lj
aGVjay9jb2NjaS9ub3RhbmQuaCBiL3NjcmlwdHMvY29jY2ljaGVjay9jb2NjaS9ub3RhbmQuaApp
bmRleCAzZGE4YzMwMy4uOTFmYTZjOTYgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvY29jY2ljaGVjay9j
b2NjaS9ub3RhbmQuaAorKysgYi9zY3JpcHRzL2NvY2NpY2hlY2svY29jY2kvbm90YW5kLmgKQEAg
LTMwMiw3ICszMDIsNiBAQAogI2RlZmluZSAgZmFzdGNhbGwKICNkZWZpbmUgIGFzbWxpbmthZ2UK
IAotI2RlZmluZSAgZmFyCiAjZGVmaW5lICBTS19GQVIKIAogLy8gcGIKZGlmZiAtLWdpdCBhL3N0
YW5kYXJkLmggYi9zdGFuZGFyZC5oCmluZGV4IDdhN2Y5NmVhLi45MzZiMTljMyAxMDA2NDQKLS0t
IGEvc3RhbmRhcmQuaAorKysgYi9zdGFuZGFyZC5oCkBAIC0yOTgsNyArMjk4LDYgQEAKICNkZWZp
bmUgIGZhc3RjYWxsCiAjZGVmaW5lICBhc21saW5rYWdlCiAKLSNkZWZpbmUgIGZhcgogI2RlZmlu
ZSAgU0tfRkFSCiAKIC8vIHBiCi0tIAoyLjMxLjEuMzY4LmdiZTExYzEzMGFmLWdvb2cKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcg
bGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1h
bi9saXN0aW5mby9jb2NjaQo=
