Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7CC2EFB49
	for <lists+cocci@lfdr.de>; Fri,  8 Jan 2021 23:42:57 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 108MgPG5005937;
	Fri, 8 Jan 2021 23:42:25 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 43D4F77D0;
	Fri,  8 Jan 2021 23:42:25 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 55E513783
 for <cocci@systeme.lip6.fr>; Fri,  8 Jan 2021 23:42:23 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 108MgMnA008654
 for <cocci@systeme.lip6.fr>; Fri, 8 Jan 2021 23:42:22 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,332,1602540000"; d="scan'208";a="486185116"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 23:42:22 +0100
Date: Fri, 8 Jan 2021 23:42:22 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Richard W.M. Jones" <rjones@redhat.com>
In-Reply-To: <20210105190008.GB27779@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2101082341230.2796@hadrien>
References: <20210105190008.GB27779@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 08 Jan 2021 23:42:28 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 08 Jan 2021 23:42:22 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Python 3.10 again: _Py_fopen deprecated
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



On Tue, 5 Jan 2021, Richard W.M. Jones wrote:

> Firstly a gentle reminder that there's a patch waiting to be applied:
> https://systeme.lip6.fr/pipermail/cocci/2020-November/thread.html#8398
>
> Different from that patch, but still related to Python 3.10, we've got
> another bug report here:
> https://bugzilla.redhat.com/show_bug.cgi?id=1912931
>
> This time _Py_fopen has been deprecated, replaced by _Py_wfopen or
> _Py_fopen_obj.  It's unclear which is better.  The two functions are
> documented here:
> https://github.com/python/cpython/blob/master/Python/fileutils.c#L1418
>
> What I don't understand from the pyxml code is why we use these
> internal Python functions at all, instead of calling regular C
> functions like fopen etc.  In fact it seems like for Python 2 we did
> call fopen ...

Everything should be up to date now on github.  Thanks for your help.
Thierry will contact you directly about the choice of fopen.

julia

>
> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> Fedora Windows cross-compiler. Compile Windows programs, test, and
> build Windows installers. Over 100 libraries supported.
> http://fedoraproject.org/wiki/MinGW
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
