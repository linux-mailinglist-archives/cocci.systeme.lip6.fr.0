Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D5C392D01
	for <lists+cocci@lfdr.de>; Thu, 27 May 2021 13:45:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 14RBiqg5017049;
	Thu, 27 May 2021 13:44:52 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B832E77F8;
	Thu, 27 May 2021 13:44:52 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 150477648
 for <cocci@systeme.lip6.fr>; Thu, 27 May 2021 13:44:51 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 14RBinDf013675
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 27 May 2021 13:44:49 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A7ADvn6hIj3VFqfZFK6lYDhIoMHBQXq8ji2hC?=
 =?us-ascii?q?6mlwRA09TyX2rayTdZgguCMc9gx+ZJhIo7npU5VoKkmyyXca2+MsAYs=3D?=
X-IronPort-AV: E=Sophos;i="5.82,334,1613430000"; d="scan'208";a="510255134"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2021 13:44:49 +0200
Date: Thu, 27 May 2021 13:44:49 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Fuad Tabba <tabba@google.com>
In-Reply-To: <CA+EHjTyvwxsFgYAUtVbo3UdhNHaqvx6rPfGLDyFX_WPN1m=XRg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2105271305530.12673@hadrien>
References: <CA+EHjTzCieJgFQOgiP5YQWurpV9dOj=bw+jF=GsTtum4vy67Ag@mail.gmail.com>
 <alpine.DEB.2.22.394.2105271224160.12673@hadrien>
 <alpine.DEB.2.22.394.2105271225320.12673@hadrien>
 <CA+EHjTyvwxsFgYAUtVbo3UdhNHaqvx6rPfGLDyFX_WPN1m=XRg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 27 May 2021 13:44:53 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 27 May 2021 13:44:49 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Adding a line to a function after all variable
 declarations
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

> @@
> expression a, b;
> identifier vcpu;
> fresh identifier vcpu_ctxt = vcpu ## "_ctxt";
> iterator name kvm_for_each_vcpu;
> identifier fc;
> @@
> kvm_for_each_vcpu(a, vcpu, b)
>  {
> /* hop over any declarations */
> + vcpu_ctxt = &vcpu->arch.ctxt;
> <+...
> fc(..., vcpu, ...)
> ...+>
>  }
>
> So I'm trying to add the line "vcpu_ctxt = &vcpu->arch.ctxt" after any
> declarations, only if there's a function in that block that's using
> vcpu. This works, but the vcpu_ctxt assignment is of course always
> added first, before any declarations.
>
> Doing the following partially works, but it of course misses the case
> where the function call with vcpu comes immediately after the
> vcpu_ctxt assignment. Removing S2 altogether gives me a parse error.
>
> @@
> expression a, b;
> identifier vcpu;
> fresh identifier vcpu_ctxt = vcpu ## "_ctxt";
> iterator name kvm_for_each_vcpu;
> identifier fc;
> statement S1, S2;
> @@
> kvm_for_each_vcpu(a, vcpu, b)
>  {
>  ... when != S1
> + vcpu_ctxt = &vcpu->arch.ctxt;
>  S2;
> <+...
> fc(..., vcpu, ...)
> ...+>
>  }

@@
identifier f;
statement S1,S2;
@@

f(...) {
... when != S1
(
+ new_code
S2
... when any
&
<+...
fc(..., vcpu, ...)
...+>
)
}

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
