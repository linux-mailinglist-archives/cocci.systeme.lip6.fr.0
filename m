Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EA33B160B
	for <lists+cocci@lfdr.de>; Wed, 23 Jun 2021 10:39:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 15N8dQ6C006615;
	Wed, 23 Jun 2021 10:39:26 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3D29877F8;
	Wed, 23 Jun 2021 10:39:26 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 270863783
 for <cocci@systeme.lip6.fr>; Wed, 23 Jun 2021 10:39:24 +0200 (CEST)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:336])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 15N8dMWs028979
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 23 Jun 2021 10:39:23 +0200 (CEST)
Received: by mail-ot1-x336.google.com with SMTP id
 6-20020a9d07860000b02903e83bf8f8fcso1155691oto.12
 for <cocci@systeme.lip6.fr>; Wed, 23 Jun 2021 01:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cKsEMM1m6IdHoRNlttCJGSQn8VzJU/E6De7kSF8QtXE=;
 b=nAloi03RbRlHbmKYMohlQ0xxjFkLugoMNOaRT4TLLSzCgVPEWnI9qGFW0dqloytdrZ
 wC5VTUtbmwstRmn4HEurpz1yS5sK0s5hU673IiTlG/TLWuw5c+C4rlyR3lPgN+RNtTeW
 PAFvhtAyVTOruDEijP/DHV5bMSefySIQVHNOKx/OBedz8D23lXbBrWdHu4TxW4FmyVPv
 clnle4fcUudJU994xG2zLxxeupy31oTISeifxE4yOWDF9Y9NOsLwo1gFKnnfcfULuEw+
 BOu0T6/hf4dUbK+RpwD43Fgl2XE5cQfgImzPZJabtHPw2WQDI0cg4X0UzBAXEYt4B2I5
 liLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cKsEMM1m6IdHoRNlttCJGSQn8VzJU/E6De7kSF8QtXE=;
 b=QSFLC0DlKRvJub8KMmyaDrqP+KSc2i24vCIqG+pRAdvCLcpK+OmEqEdEy/6sxJDw/E
 S7ZaiiW1e+fpqG814IJs3tXJWa0ctiyjgT6hsrF0QjdjDXsJpFvz6v2GczMYJ+fFZEWQ
 xuX0C3tIQ3yRM6vfq0ZLZeAehIgVRarTb3A2PNQrdYXgYzC2gXi5l+7hTXmy0pdiig8z
 cKM9kg0K7o/lNjvoyD00eZyff53oYKJWRsbgwwm1LCSeVzAxe0iC3FNlJL5elon6ISkA
 XNthm2J7BqhJ1Nqn4e7+gMwnYwhA0+XRjKDufPQbI/7jAow89XtvYcmli9ku2lhNtmoe
 ieAw==
X-Gm-Message-State: AOAM533fUmJJzK9ODIMl3sCHmHfM35ArZlxCjgEQJM1lFA2MF3b34BFI
 amVwtM+qMd06Jut2EisVTjUdfrwA/Lc2q6gtxCsPk6YbJFxNYQ==
X-Google-Smtp-Source: ABdhPJyqdC6RY2JF1bs1KZU0W7lRf2ujwIqpt/BBITjGShmSrxdOKLaMRt0crp4a68Fz3D+idXaHwtVJvJQzV5ldjcg=
X-Received: by 2002:a05:6830:2315:: with SMTP id
 u21mr6931801ote.365.1624437561585; 
 Wed, 23 Jun 2021 01:39:21 -0700 (PDT)
MIME-Version: 1.0
From: Fuad Tabba <tabba@google.com>
Date: Wed, 23 Jun 2021 09:38:45 +0100
Message-ID: <CA+EHjTxxAb4fsg1bUi2E1FpNjOXFrRCFvw9CzDyquSQ5fWA5Ew@mail.gmail.com>
To: cocci@systeme.lip6.fr
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 23 Jun 2021 10:39:27 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 23 Jun 2021 10:39:23 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] Adding a newline after a variable definition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Hi,

I have a semantic patch that inserts a new variable definition into a
function. I would like it if that variable definition is the only one
in the function, then it should add a new line to separate the
definition from following statements (Linux code formatting style).

I thought that doing this in two steps might be easier, i.e., add the
definition, then check and add a newline if a statement follows:

@@
identifier x;
identifier func;
statement S;
@@
func(...)
 {
struct kvm_cpu_context *x = ...;
+ newline;
S
...
 }

The above works as expected, and it adds "newline;" after the
definition of x. The thing is, is it possible to add an actual new
line, as opposed to a non-whitespace string? I tried just using a +
but that didn't work.

Thanks!
/fuad
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
