Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED331A03F
	for <lists+cocci@lfdr.de>; Fri, 12 Feb 2021 15:05:31 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11CE52Lr009830;
	Fri, 12 Feb 2021 15:05:02 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2925F77DD;
	Fri, 12 Feb 2021 15:05:02 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 010633B26
 for <cocci@systeme.lip6.fr>; Fri, 12 Feb 2021 15:05:00 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11CE4vGh005559
 for <cocci@systeme.lip6.fr>; Fri, 12 Feb 2021 15:04:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,173,1610406000"; d="scan'208";a="372900469"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 15:04:56 +0100
Date: Fri, 12 Feb 2021 15:04:56 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <0c2a01f3-e48b-fc67-78b4-f061026aec42@linux.com>
Message-ID: <alpine.DEB.2.22.394.2102121504100.9350@hadrien>
References: <0c2a01f3-e48b-fc67-78b4-f061026aec42@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 12 Feb 2021 15:05:03 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 12 Feb 2021 15:04:57 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Backward compatibility issue
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



On Thu, 11 Feb 2021, Denis Efremov wrote:

> Hi, one of my patterns started to fail tests on latest coccinelle.
> I've bisected the commit that introduces "error". It's:
> commit db60e916633d2cb3ae31140364783fdf85ed10f4
> "make information about SmPL iterator and declarer names available to the C parser"
>
> To reproduce the error:
> $ cd linux
> $ git checkout 5b01014759991887b1e450c9def01e58c02ab81b
> $ wget https://raw.githubusercontent.com/evdenis/cvehound/master/cvehound/cve/CVE-2016-9793.cocci
> $ spatch -D detect --cocci-file CVE-2016-9793.cocci net/core/sock.c
> # spatch before db60e916633d2cb3ae31140364783fdf85ed10f4 will find the match
> net/core/sock.c:718:16-17: ERROR: CVE-2016-9793
> net/core/sock.c:754:16-17: ERROR: CVE-2016-9793
> ...
> # spatch >= db60e916633d2cb3ae31140364783fdf85ed10f4 will not match the same code

If you change typedef u32 to symbol u32, it should be good.  It is no use
to Coccinelle to know that u32 is a typedef in this code.

julia


>
> Thanks,
> Denis
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
