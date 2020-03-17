Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15116187938
	for <lists+cocci@lfdr.de>; Tue, 17 Mar 2020 06:28:58 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02H5Sgh6026646;
	Tue, 17 Mar 2020 06:28:42 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8C7F9781F;
	Tue, 17 Mar 2020 06:28:42 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 76CD83B93
 for <cocci@systeme.lip6.fr>; Tue, 17 Mar 2020 06:28:41 +0100 (CET)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1031])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02H5SdUL019278
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 17 Mar 2020 06:28:40 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id m15so9236980pje.3
 for <cocci@systeme.lip6.fr>; Mon, 16 Mar 2020 22:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=JoKiQKtVkJixm7HOe5ke9PY52BrPYsvdeaFN6yeeBS4=;
 b=cJgnhTdsdLfYVyXW7+H/45+fO9kQTiZqfDUCLXBHVi0fkKQkS1W3JdhD4ky5FRPZG+
 LrG2a1yJLzidJoLh/rdBnDoj+AyfZ9Jk+Zd3jzdIp7yD12v31V4e19jdrLLregGvK0wt
 rtcoIYE9oHu5CT/KbN7MVRVXYOG2vwmwsASpNFSAFI3tO9mlVo4JQLzhvYGHGF/Eq+In
 aQh/84BCZTXymPE1TdY2ZFWVZgqyoIzt+2L9312B1cZ5i85ETjfquXhdLhOTSDHMcuZP
 mkxES01o+zMO0AHIoa8JmQhmc5PPcuXYVUKpeDeQ4hQ53AYeOinEe7pApJJBDQ0viGVH
 VWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=JoKiQKtVkJixm7HOe5ke9PY52BrPYsvdeaFN6yeeBS4=;
 b=qBzSELi5xXqgOK7RZ3mgQa+HU1bzyZA8I1S4OOdsWl6e1A5th9uGU2BmXRCc4Q+qmv
 TZ3HEXBOOigq1fuku/8bRxsYMQT9VnDT5MbO0Nn4OebaDYPTQZGMykuBp4iYln31DbY+
 4v9SrtZileZErQ2LfJvpBnFj1eaG6tCK+iL54fKJeYnXTLhvh4x7I7OFuj4c5kKsL0QY
 JEceAmfQ7XPk63SFMB+q/nkWv9N8OOQArvizll+SIphHvBsxGB0fpEho99Z/KTGkZX4z
 cqxq0rZKNyenlI700JAzfG8rxCOX1cYIWZ7QAUgUqo7W5hPvpINu5iQoirSjio2avZJo
 HyEA==
X-Gm-Message-State: ANhLgQ0+ynSmlAv4UDdnWPJt9JZboorAIVEH0sc1UAx0RzazaIa37L75
 VPvST4hSqLTiLclahvkdcvs=
X-Google-Smtp-Source: ADFU+vtRrfe8BhSkpL40QqrHv+aQAFVgcEoXhmUPkFhgMb55c+yM+lOjMJZUG2XRI0LaPN5aDVH5vw==
X-Received: by 2002:a17:90a:7185:: with SMTP id i5mr3516814pjk.2.1584422918545; 
 Mon, 16 Mar 2020 22:28:38 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1672:6342:3ccf:a5d:a11e:f77e])
 by smtp.gmail.com with ESMTPSA id r29sm1105651pgm.17.2020.03.16.22.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 22:28:38 -0700 (PDT)
Message-ID: <3a335c7aef78ea5762248484a645eb5ff27b973c.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 17 Mar 2020 10:58:32 +0530
In-Reply-To: <4d55d76c-29d1-1c88-d8ad-606e32a938d9@web.de>
References: <4d55d76c-29d1-1c88-d8ad-606e32a938d9@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 17 Mar 2020 06:28:42 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 17 Mar 2020 06:28:40 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
        "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH 06/26] parsing_cocci: arity: Add cases for
 ParenType/FunctionType
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

T24gTW9uLCAyMDIwLTAzLTE2IGF0IDIwOjIwICswMTAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+IFBhcmVuVHlwZSBhbmQgRnVuY3Rpb25UeXBlIGFyZSBhZGRlZCB0byB0aGUgU21QTCBBU1Rz
Lgo+ID4gQWRkIGNhc2VzIGZvciB0aGVzZSB0eXBlcyBpbiDigKYubWwuCj4gCj4gQSBjaGFuZ2Ug
ZGVzY3JpcHRpb24gdGVtcGxhdGUgd2FzIHVzZWQgc2V2ZXJhbCB0aW1lcy4KPiBJIHdvbmRlciBp
ZiB0aGVyZSBpcyByZWFsbHkgYSBuZWVkIHRvIG1vZGlmeSBvbmx5IGEgc2luZ2xlIE9DYW1sCj4g
c291cmNlIGZpbGUKPiBpbiB0aGVzZSB1cGRhdGUgc3RlcHMuCj4gSG93IGRvIHlvdSB0aGluayBh
Ym91dCB0byBjb21iaW5lIHN1Y2ggY2hhbmdlcyBpbiBhIGJpZ2dlciB1cGRhdGUKPiBzdGVwPwo+
IAoKVGhlc2UgYXJlIHNlcGFyYXRlZCB0aGlzIHdheSBzbyB0aGF0IGl0J3MgZWFzaWVyIGZvciBK
dWxpYSB0byByZXZpZXcuClNoZSB3aWxsIHByb2JhYmx5IGp1c3Qgc3F1YXNoIGFsbCAyNiBvZiB0
aGVzZSB0b2dldGhlciBhbmQgYXBwbHkgdGhlbQpsYXRlci4KCkNoZWVycywKSmFza2FyYW4uCgo+
IFJlZ2FyZHMsCj4gTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBz
Oi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlzdGluZm8vY29jY2kK
