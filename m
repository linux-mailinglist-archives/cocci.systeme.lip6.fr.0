Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA08326D6D
	for <lists+cocci@lfdr.de>; Sat, 27 Feb 2021 15:47:59 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11RElYfk023303;
	Sat, 27 Feb 2021 15:47:34 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2EBCF77DE;
	Sat, 27 Feb 2021 15:47:34 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6714F3E64
 for <cocci@systeme.lip6.fr>; Sat, 27 Feb 2021 15:38:40 +0100 (CET)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:135])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11REcdYj006783
 for <cocci@systeme.lip6.fr>; Sat, 27 Feb 2021 15:38:39 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id p21so18256871lfu.11
 for <cocci@systeme.lip6.fr>; Sat, 27 Feb 2021 06:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qeuGxNTdYsmRWEr8GfJ2PuJ1Dq/3vI85twMSNS13sg0=;
 b=MbV0WcPD1AAxs880LP/oU3bAql4vTTW+SMNVveI6AfBkIbJIBeZkrsq2cDLvnijlzl
 bMcy1VVdigSUeY1nel+RzMn5bz39kOq5OD/It1OuAUg6MyLxKGchuM5LuCoKqfvWRSIC
 y9urfeOCuZwOJN3yVmeH6LrGNGErkaB0Px+DyJ6fiOz7L3QFGrFxXzIhGX8cFmT6nG18
 aKX8tuZVzhPEBUKOLc7qbfmy0qJ/1eMqu1Dzo0mqEOuJGvZTjpoc/bRGpI6D9RtZIIjM
 gOjcHiY/j7jRqAa0Oc7HWvbS1NuxW5jBX4qiaoZIYdGJqam0PQ4YQwWO1TwlcVCZwQl9
 zBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qeuGxNTdYsmRWEr8GfJ2PuJ1Dq/3vI85twMSNS13sg0=;
 b=VbxCzMcreVhGu8C8IoeG0HxBVZqSoaW8GOdNnfiCm/CZ9+DKaUkEU3iuVHvjqXHvak
 3v3r//41vY4mmsJTP1QxiVMq6mQDq6kQFdqjK6l/fCzNexGO01vkm6xSeIfPzH+JFe7q
 IleYbV2tX+9h1KZ2Pk8jXeZ10MZ0EPrCo5OLPHhgKbKyBG7knH2Vx8pl8qljagTehTY+
 1hdN38ToVdoBcDkdaR9K4KKZBMGv2+jD15XmtklloqWASF1xWC0ACWjmM5YVc0RwZsq+
 ef6O12Q3aFo0XVtCh9spUbYIjNOQcViHT81FsIE5j8ZefxDXnvxC+TeHAHi8f9ebD4Bf
 3qtA==
X-Gm-Message-State: AOAM5330YQcFxpxUwmp4M0aT54F1K5LHFMXPl5/tn44R8PV+vKuA2K5j
 S/6lw5SKEc+zhdz7kSzLYaZdZukCX0PbXA==
X-Google-Smtp-Source: ABdhPJwnlMTquUSSXdz9DeUxPM84QmT+7DlkNvWHzd1RhBFpCpO4iSL0zBJERgnyKuaD7gjsbeA7pA==
X-Received: by 2002:a05:6512:308d:: with SMTP id
 z13mr4453158lfd.71.1614436718857; 
 Sat, 27 Feb 2021 06:38:38 -0800 (PST)
Received: from [10.68.32.192] (broadband-188-32-236-56.ip.moscow.rt.ru.
 [188.32.236.56])
 by smtp.gmail.com with ESMTPSA id t142sm1492554lff.255.2021.02.27.06.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Feb 2021 06:38:38 -0800 (PST)
To: Julia Lawall <julia.lawall@inria.fr>
References: <alpine.DEB.2.22.394.2102270905410.2926@hadrien>
 <47b8a2cd-ff8a-ac8c-a9b1-015488bbc959@gmail.com>
 <alpine.DEB.2.22.394.2102271013190.2926@hadrien>
From: Denis Efremov <yefremov.denis@gmail.com>
Message-ID: <f4369a0b-aed9-ae77-a44a-99e468d7cb4d@gmail.com>
Date: Sat, 27 Feb 2021 17:38:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2102271013190.2926@hadrien>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 27 Feb 2021 15:47:34 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sat, 27 Feb 2021 15:38:39 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Sat, 27 Feb 2021 15:47:31 +0100
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] release of version 1.1.0
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



On 2/27/21 12:14 PM, Julia Lawall wrote:
> 
> 
> On Sat, 27 Feb 2021, Denis Efremov wrote:
> 
>> Hi,
>>
>> Great news!
>>
>> Could you please create release tag on GitHub?
>> This will allow me to add this version to tests and add new opam package version.
>> Currently, I use these versions for tests:
>> https://github.com/evdenis/cvehound/blob/master/.github/workflows/test.yml#L25
> 
> There is no tag at the moment.  I have asked why.
> 
>>
>> BTW, is there 1.0.9 version? I see that fedora provides 1.0.9 version,
>> but there is not release tag for it and there is no opam package for it.
> 
> No, there is no version 1.0.9.  We moved on to 1.1 due to the #spatch
> feature.
> 

Seems like there is a mess. There is a commit with 1.0.9 release planned:
https://github.com/coccinelle/coccinelle/commit/842075f77505386a782030ebffb1acf7f4237737#diff-652d5876e7e73c420820682a12ecdec66ecdec029223e24808e129d64493a967

Repology says that Fedora provides most recent coccinelle version:
https://repology.org/project/coccinelle/versions 
Other distibutives use 1.0.8 version.

On Fedora:
$ sudo dnf info coccinelle 
Installed Packages
Name         : coccinelle
Version      : 1.0.9
Release      : 0.14.gitd0fd4c7d.fc33.1 // <== d0fd4c7d commit reference
Architecture : x86_64
Size         : 26 M
Source       : coccinelle-1.0.9-0.14.gitd0fd4c7d.fc33.1.src.rpm

$ /usr/bin/spatch --version
spatch version 1.0.8-gc1dbb4f-dirty compiled with OCaml version 4.11.1
Flags passed to the configure script: --build=x86_64-redhat-linux-gnu --host=x86_64-redhat-linux-gnu --program-prefix= --disable-dependency-tracking --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --with-python=/usr/bin/python3 --with-menhir=/usr/bin/menhir
OCaml scripting support: yes
Python scripting support: yes
Syntax of regular expressions: PCRE

Fedora 33, 1.0.9 version points to commit:
$ fedpkg clone -a coccinelle
$ cd coccinelle
$ git checkout f33
$ cat coccinelle.spec | grep commit
%global commit d0fd4c7dfa70763870914eedee7022fa35f700e2
%global shortcommit d0fd4c7d

Fedora 34 also uses d0fd4c7d as base for 1.0.9 version.
Fedora 32 points to 111d328fee1303f14a5b9def835301d849e41331.

Maybe release 1.0.9 wasn't planned, but as my personal opinion adding 1.0.9 tag is not a bad idea
just to reference some commit (for example, d0fd4c7d) and have 1.0.9 version to run
backward compatibility tests on it.
https://github.com/coccinelle/coccinelle/releases

Thanks,
Denis

>>
>> On 2/27/21 11:11 AM, Julia Lawall wrote:
>>> A new version 1.1.0 has been released.  The most interesting change is the
>>> ability to put spatch command line options in a .cocci file, for example:
>>>
>>> #spatch --very-quiet -j 8 --recursive-includes --include-headers-for-types
>>>
>>> Other specific improvements are an improved handling of attributes and a
>>> more efficient treatment of header files (all thanks to Jaskaran Singh).
>>>
>>> Various other small issues have been addressed.
>>>
>>> All of these changes have already been available on github.
>>>
>>> julia
>>> _______________________________________________
>>> Cocci mailing list
>>> Cocci@systeme.lip6.fr
>>> https://systeme.lip6.fr/mailman/listinfo/cocci
>>>
>> _______________________________________________
>> Cocci mailing list
>> Cocci@systeme.lip6.fr
>> https://systeme.lip6.fr/mailman/listinfo/cocci
>>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
