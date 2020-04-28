Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2C1BC6F6
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:44:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SHiJs9019790;
	Tue, 28 Apr 2020 19:44:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EAD0F782D;
	Tue, 28 Apr 2020 19:44:18 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B4C313DC8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:44:16 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SHiGFr013702
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:44:16 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,328,1583190000"; d="scan'208";a="347207321"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 19:44:15 +0200
Date: Tue, 28 Apr 2020 19:44:15 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Paul Chaignon <paul@cilium.io>
In-Reply-To: <20200428101124.GA18321@Mem>
Message-ID: <alpine.DEB.2.21.2004281943320.3273@hadrien>
References: <20200428101124.GA18321@Mem>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:44:19 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:44:16 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, paul.chaignon@gmail.com
Subject: Re: [Cocci] Using a macro for variable attributes
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



On Tue, 28 Apr 2020, Paul Chaignon wrote:

> Hi all,
>
> I am working on a small semantic patch to annotate specific variables in
> our codebase with __attribute__((aligned(8))). The following program works
> fine.
>
>   @r@
>   expression e1, e2;
>   identifier x;
>   @@
>   (
>     struct \(icmphdr\|icmp6hdr\) x
>   + __attribute__((aligned(8)))
>     ;
>   |
>     struct \(icmphdr\|icmp6hdr\) x
>   + __attribute__((aligned(8)))
>     = ...;
>   )
>     ... when exists
>     ctx_load_bytes(e1, e2, &x, ...)
>
> However, when I replace __attribute__((aligned(8))) with our internal
> macro __align_stack_8, it fails with the following error:
>
>   plus: parse error:
>     File "/home/paul/cilium/contrib/coccinelle/aligned.cocci", line 7, column 2, charpos = 77
>     around = '__align_stack_8',
>     whole content = + __align_stack_8
>
> I've tried adding '#define __align_stack_8' in a file passed with
> --macro-file, without success. Is this a known limitation for macros or
> am I missing something?

Try adding the "metavariable" declaration:

attribute name __align_stack_8;

julia

>
> Thanks,
> Paul
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
