Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9C814962C
	for <lists+cocci@lfdr.de>; Sat, 25 Jan 2020 16:02:07 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00PF1Zds027716;
	Sat, 25 Jan 2020 16:01:35 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0B5E077F7;
	Sat, 25 Jan 2020 16:01:35 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0DB7F77E4
 for <cocci@systeme.lip6.fr>; Sat, 25 Jan 2020 16:01:33 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00PF1TDs018205
 for <cocci@systeme.lip6.fr>; Sat, 25 Jan 2020 16:01:29 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,361,1574118000"; d="scan'208";a="336998798"
Received: from ip-241.net-89-2-7.rev.numericable.fr (HELO hadrien)
 ([89.2.7.241])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jan 2020 16:01:29 +0100
Date: Sat, 25 Jan 2020 16:01:28 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200121122458.5513-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2001251601130.3236@hadrien>
References: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
 <20200121122458.5513-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 25 Jan 2020 16:01:37 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 25 Jan 2020 16:01:29 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v3 0/3] cocci: Improve management of macros
 before typedefs
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



On Tue, 21 Jan 2020, Jaskaran Singh wrote:

> This patch series is for improving the management of the following
> case:
>
> <macro> <typedef> <ident>
>
> If <typedef> is a known typedef (such as u8 or *_t) then label <macro> as a
> CppMacro. Subsequent cases will continue to label <typedef> correctly as a
> typedef identifier.
>
> Also add bool to the list of known typedefs so that cases of
>
> <macro> bool <ident>
>
> are handled correctly just like any known typedef will be.
>
> Changes in v3:
> --------------
> - Change "subsequent cases will label" to "subsequent cases will continue to
>   label" in commit messages of Patch 0/3 and Patch 1/3.
> - Change the term "typedef ident" to "typedef identifier" wherever
>   suitable.
> - Add metavariable symbol false to tests/macro_before_bool.cocci to
>   suppress warning.
>
> Changes in v2:
> --------------
> - Group these patches as a series for clarity
> - Add a test case for <macro> bool <ident> (Patch 3/3)
> - Explain what has been improved with Patch 2/3

All applied.  Thanks!

julia

>
>  parsing_c/parsing_hacks.ml    |   37 ++++++++++++++++++++++++++++++++++++-
>  tests/macro_before_bool.c     |    4 ++++
>  tests/macro_before_bool.cocci |   10 ++++++++++
>  tests/macro_before_bool.res   |    5 +++++
>  4 files changed, 55 insertions(+), 1 deletion(-)
>
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
